#include "convertprotopri.h"

ConvertProToPri::ConvertProToPri(QObject *parent) : QObject(parent)
{

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
