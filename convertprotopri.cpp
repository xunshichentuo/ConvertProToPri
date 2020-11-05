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
    this->srcFile.setFileName(srcFilePath);
    if(!this->srcFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<srcFilePath;
        return "";
    }

    return srcFile.readLine();
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
