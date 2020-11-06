#include "convertprotopri.h"

ConvertProToPri::ConvertProToPri(QObject *parent) : QObject(parent)
{
    initKeyword();
}

ConvertProToPri::ConvertProToPri(const QString srcFilePath, QObject *parent) : QObject(parent)
{
    initKeyword();
    loadSrcFile(srcFilePath);
    moveToFileHead();
}

QString ConvertProToPri::convertOneConfig(const QString &waitConverted)
{
    QString converted = waitConverted;

    if(isNeedConvert(waitConverted)) {
        QStringList pathList = getPathList(waitConverted);
        converted = addPwdHeadPathInPaths(converted, pathList);
    }
    return converted;
}

bool ConvertProToPri::isNeedConvert(const QString &waitConverted)
{
    for(QString keyword : hasPathKeywords) {
        if(waitConverted.contains(keyword)) {
            return true;
        }
    }
    return false;
}

QString ConvertProToPri::addPwdHeadPathInPaths(const QString &waitConverted, QStringList pathList)
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

QString ConvertProToPri::convertFile()
{
    if(!isOpenSrcFile()) return "";
    return srcFile.readLine();
}

QString ConvertProToPri::convertNextLine()
{
    QString rawLine = this->srcFile.readLine();
}

QString ConvertProToPri::convertOneLine(const int index)
{
    if(!isOpenSrcFile()) return "";
    if(!isValidIndex(index)) return "";

    QString rawLineData = getSpecifiedLineContent(index);
    QString convertLineData = convertPwdPath(rawLineData);
    return convertLineData;
}

bool ConvertProToPri::needConvert(const int index)
{
    return false;
}

QString ConvertProToPri::readOneLineFromSourceFile(const QString srcPath)
{
    QFile proFile(srcPath);
    if(!proFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<srcPath;
        return "";
    }

    QString line = proFile.readLine();
    return line;
}

int ConvertProToPri::getSourceFileLineNumber(const QString srcPath)
{
    QFile proFile(srcPath);
    if(!proFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<srcPath;
        return 0;
    }

    int count = 0;
    while(!proFile.atEnd()) {
        proFile.readLine();
        count++;
    }

    return count;
}

void ConvertProToPri::initKeyword()
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

void ConvertProToPri::loadSrcFile(const QString srcFilePath)
{
    this->srcFile.setFileName(srcFilePath);
    this->srcFile.open(QIODevice::ReadOnly);
}

bool ConvertProToPri::isOpenSrcFile()
{
    return this->srcFile.isOpen();
}

bool ConvertProToPri::isValidIndex(const int index)
{
    if(index >=0) {
        return true;
    } else {
        qDebug()<<"ConvertProToPri::isValidIndex error index:"<<index;
        return false;
    }
}

QString ConvertProToPri::convertPwdPath(const QString &lineContent)
{
    QString convertedLine = lineContent;
    convertedLine.replace("$$PWD", "$$PWD/Moonray");
    return convertedLine;
}

QStringList ConvertProToPri::getPathList(const QString &data)
{
    QStringList linesContent = data.trimmed().split("=");
    if(linesContent.length() != 2) return QStringList("");

    QString parameters = linesContent.at(1);
    QStringList parameterList;
    QString libsKeyword = QString("LIBS");
    if(!linesContent.at(0).contains(libsKeyword)) {
        parameterList = parameters.trimmed().remove("\r\n").split('\\');
        parameterList.removeAll(QString(""));
    }
    return parameterList;
}

void ConvertProToPri::moveToFileHead()
{
    this->srcFile.seek(0);
}

void ConvertProToPri::moveToSpecifiedLine(const int index)
{
    if(index - 1 <0) return;
    for(int i=0;i<index-1;i++) {
        this->srcFile.readLine();
    }
}

QString ConvertProToPri::getSpecifiedLineContent(const int index)
{
    QString matchedLine = "";
    moveToFileHead();
    moveToSpecifiedLine(index);
    matchedLine = this->srcFile.readLine();
    return matchedLine;
}

int ConvertProToPri::getFirstKeyWordLineNumber(const QString filePath, const QString keyword)
{
    QFile proFile(filePath);
    if(!proFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<filePath;
        return 0;
    }

    int count = 0;
    while(!proFile.atEnd()) {
        QString line = proFile.readLine();
        count++;
        if(line.contains(keyword))
            break;
    }
    return count;
}

QString ConvertProToPri::getFirstKeyWordLineData(const QString filePath, const QString keyword)
{
    QFile proFile(filePath);
    if(!proFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<filePath;
        return 0;
    }

    QString matchedLine;
    while(!proFile.atEnd()) {
        QString line = proFile.readLine();
        if(line.contains(keyword)) {
            matchedLine = line;
            break;
        }
    }

    matchedLine.replace("$$PWD", "$$PWD/Moonray");
    return matchedLine;
}
