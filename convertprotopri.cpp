#include "convertprotopri.h"

ConvertProToPri::ConvertProToPri(QObject *parent) : QObject(parent)
{
    keywordList.clear();
    keywordList.append("HEADERS");
    keywordList.append("SOURCES");
    keywordList.append("DISTFILES");
    keywordList.append("RESOURCES");
    keywordList.append("QMAKE_INFO_PLIST");
}

QString ConvertProToPri::convertFile(const QString srcFilePath)
{
    loadSrcFile(srcFilePath);
    if(!isOpenSrcFile()) return "";

    return srcFile.readLine();
}

QString ConvertProToPri::convertOneLine(const QString srcFilePath, const int index)
{
    loadSrcFile(srcFilePath);
    if(!isOpenSrcFile()) return "";

    if(!isValidIndex(index)) return "";

    QString rawLineData = getSpecifiedLineContent(index);
    return rawLineData.replace("$$PWD", "$$PWD/Moonray");
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

int ConvertProToPri::getLineNumberOfHEADERS(const QString srcPath)
{
    return getFirstKeyWordLineNumber(srcPath, "HEADERS");
}

int ConvertProToPri::getLineNumberOfSOURCES(const QString srcPath)
{
    return getFirstKeyWordLineNumber(srcPath, "SOURCES");
}

int ConvertProToPri::getLineNumberOfDISTFILES(const QString srcPath)
{
    return getFirstKeyWordLineNumber(srcPath, "DISTFILES");
}

int ConvertProToPri::getLineNumberOfRESOURCES(const QString srcPath)
{
    return getFirstKeyWordLineNumber(srcPath, "RESOURCES");
}

int ConvertProToPri::getLineNumberOfQMAKEINFOPLIST(const QString srcPath)
{
    return getFirstKeyWordLineNumber(srcPath, "QMAKE_INFO_PLIST");
}

QString ConvertProToPri::convertQMAKEINFOPLIST(const QString srcPath)
{
    return getFirstKeyWordLineData(srcPath, "QMAKE_INFO_PLIST");
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
    return (index >=0);
}

QString ConvertProToPri::getSpecifiedLineContent(const int index)
{
    QString matchedLine = "";
    this->srcFile.seek(0);
    for(int i=0;i<index;i++) {
        matchedLine = this->srcFile.readLine();
    }
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
