#include "parseproconfig.h"

ParseProConfig::ParseProConfig(QObject *parent) : QObject(parent)
{
    hasPathKeywords.clear();
    hasPathKeywords.append("HEADERS");
    hasPathKeywords.append("SOURCES");
    hasPathKeywords.append("DISTFILES");
    hasPathKeywords.append("RESOURCES");
    hasPathKeywords.append("QMAKE_INFO_PLIST");
    hasPathKeywords.append("LIBS");
    hasPathKeywords.append("RC_ICONS");
    hasPathKeywords.append("INCLUDEPATH");
    hasPathKeywords.append("DEPENDPATH");
    hasPathKeywords.append("RESOURCES");
    hasPathKeywords.append("TRANSLATIONS");
}

QString ParseProConfig::convertOneConfig(const QString &waitConverted)
{
    QString converted = waitConverted;

    if(isNeedConvert(waitConverted)) {
        QStringList toBeConvertPathListpathList = getToBeConvertPathList(waitConverted);
        converted = addPwdHeadPathInPaths(converted, toBeConvertPathListpathList);
    }
    return converted;
}

QStringList ParseProConfig::getToBeConvertPathList(const QString &data)
{
    QStringList linesContent = data.trimmed().split("=");
    if(linesContent.length() != 2)
        return QStringList("");

    QStringList needConvertedPaths;
    if(containsHasLibConfigAndDontHasRungL(linesContent)) {
        return needConvertedPaths;
    }

    if(containsRungLPath(linesContent)) {
        return getBeConvertedRungLPath(linesContent);
    } else {
        return removeAllSpace(getBeConvertedNormalPath(linesContent));
    }
}

bool ParseProConfig::isNeedConvert(const QString &waitConverted)
{
    for(QString keyword : hasPathKeywords) {
        if(waitConverted.contains(keyword)) {
            return true;
        }
    }
    return false;
}

QStringList ParseProConfig::removeAllSpace(const QStringList &data)
{
    QStringList removeList;
    for(int i=0;i<data.length();i++) {
        removeList.append(removeSpace(data.at(i)));
    }
    return removeList;
}

QString ParseProConfig::removeSpace(const QString &data)
{
    QString removeResult = data;
    removeResult.remove(QRegExp("\\s"));
    return removeResult;
}

bool ParseProConfig::containsHasLibConfigAndDontHasRungL(const QStringList &libConfig)
{
    if(libConfig.at(0).contains("LIBS") && !libConfig.at(1).contains("-L")) {
        return true;
    } else {
        return false;
    }
}

bool ParseProConfig::containsRungLPath(const QStringList &configData)
{
    return configData.at(1).contains("-L");
}

QStringList ParseProConfig::getBeConvertedRungLPath(const QStringList &configData)
{
    int rungLPos = configData.at(1).indexOf("-L") + QString("-L").length();
    return QStringList(configData.at(1).mid(rungLPos));
}

QStringList ParseProConfig::getBeConvertedNormalPath(const QStringList &configData)
{
    QStringList convertedList = configData.at(1).trimmed().remove("\r\n").split('\\');
    convertedList.removeAll(QString(""));
    return convertedList;
}

QString ParseProConfig::addPwdHeadPathInPaths(const QString &waitConverted, const QStringList &toBeConvertList)
{
    QString converted = waitConverted;
    for(QString path : toBeConvertList) {

        QVector<int> startPosSet;
        startPosSet = getStartPosSet(converted, path);


        qDebug()<<"path:"<<path<<"|||||converted:"<<converted;
        qDebug()<<"ParseProConfig::addPwdHeadPathInPaths replaceStartPos:"<<startPosSet;


        if(startPosSet.length() == 0) continue;
        for(int i=0;i<startPosSet.length();i++) {
            QChar charBeforeConverted = converted.at(startPosSet.at(i)-1);
            qDebug()<<"charBeforeConverted:"<<charBeforeConverted;
            if(charBeforeConverted == QChar(0x20) || charBeforeConverted == '\n' || charBeforeConverted == 'L')
                converted.replace(startPosSet.at(i), path.length(), getReplacePath(path));
        }

//        converted.replace(path, getReplacePath(path));
    }
    return converted;
}

QVector<int> ParseProConfig::getStartPosSet(const QString &waitConverted, const QString &path)
{
    QVector<int> startPosSet;
    int occurrencesNumber = waitConverted.count(path);
    int replaceStartPos = -1;
    for(int i=0;i<occurrencesNumber;i++) {
        replaceStartPos = waitConverted.indexOf(QString("%1").arg(path), replaceStartPos+1);
        if(replaceStartPos == -1) break;
        startPosSet.append(replaceStartPos);
    }
    return startPosSet;
}

QString ParseProConfig::getReplacePath(const QString &path)
{
    QString pwdKeyword = "$$PWD";
    QString pwdReplaceKeyWord = "$$PWD/Moonray";
    QString replacePath = path;
    if(replacePath.contains(pwdKeyword)) {
        replacePath.replace(pwdKeyword, pwdReplaceKeyWord);
    } else {
        replacePath = pwdReplaceKeyWord + "/" + path;
    }
    return replacePath;
}
