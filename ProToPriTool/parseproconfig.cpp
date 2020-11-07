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
        return removeAllFrontBlank(getBeConvertedNormalPath(linesContent));
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

QStringList ParseProConfig::removeAllFrontBlank(const QStringList &data)
{
    QStringList removeList;
    for(int i=0;i<data.length();i++) {
        removeList.append(removeFrontBlank(data.at(i)));
    }
    return removeList;
}

QString ParseProConfig::removeFrontBlank(const QString &data)
{
    QString removeResult = data;
    removeResult.remove(QRegExp("^ +\\s*"));
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

QString ParseProConfig::addPwdHeadPathInPaths(const QString &waitConverted, QStringList toBeConvertList)
{
    QString converted = waitConverted;
    for(QString path : toBeConvertList) {
        converted.replace(path, getReplacePath(path));
    }
    return converted;
}

QString ParseProConfig::getReplacePath(const QString &path)
{
    QString pwdHead = "$$PWD/Moonray/";
    QString pwdKeyword = "$$PWD";
    QString pwdReplaceKeyWord = "$$PWD/Moonray";
    QString replacePath = path;
    if(replacePath.contains(pwdKeyword)) {
        replacePath.replace(pwdKeyword, pwdReplaceKeyWord);
    } else {
        replacePath = pwdHead+path;
    }
    return replacePath;
}
