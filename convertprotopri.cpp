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

int ConvertProToPri::getSrcFileHEADERSLineNumber(const QString srcPath)
{
    QFile proFile(srcPath);
    if(!proFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<srcPath;
        return 0;
    }

    int count = 0;
    while(!proFile.atEnd()) {
        QString line = proFile.readLine();
        count++;
        if(line.contains("HEADERS"))
            break;
    }
    return count;
}

int ConvertProToPri::getSrcFileSOURCESLineNumber(const QString srcPath)
{
    QFile proFile(srcPath);
    if(!proFile.open(QIODevice::ReadWrite)) {
        qDebug()<<"pro file open failed:"<<srcPath;
        return 0;
    }

    int count = 0;
    while(!proFile.atEnd()) {
        QString line = proFile.readLine();
        count++;
        if(line.contains("SOURCES"))
            break;
    }
    return count;
}
