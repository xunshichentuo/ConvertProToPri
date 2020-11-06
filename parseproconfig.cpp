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
        QStringList pathList = getPathList(waitConverted);
        converted = addPwdHeadPathInPaths(converted, pathList);
    }
    return converted;
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

QStringList ParseProConfig::getPathList(const QString &data)
{
    QStringList linesContent = data.trimmed().split("=");
    if(linesContent.length() != 2)
        return QStringList("");

    QStringList needConvertedPaths;
    if(libsConfigDontHasRungL(linesContent))
        return needConvertedPaths;

    if(containsRungLPath(linesContent)) {
        return getBeConvertedRungLPath(linesContent);
    } else {
        return getBeConvertedNormalPath(linesContent);
    }
}

bool ParseProConfig::libsConfigDontHasRungL(const QStringList &libConfig)
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

QString ParseProConfig::addPwdHeadPathInPaths(const QString &waitConverted, QStringList pathList)
{
    QString converted = waitConverted;
    QString pwdHead = "$$PWD/Moonray/";

    for(QString path : pathList) {
        if(path.contains("$$PWD")) {
            QString replacePath = path;
            replacePath.replace("$$PWD", "$$PWD/Moonray");
            converted.replace(path, replacePath);
        } else {
            converted.replace(path, pwdHead+path);
        }
    }
    return converted;
}
