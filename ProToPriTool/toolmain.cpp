#include <QCoreApplication>
#include <QFile>
#include <QDebug>
#include <QFileInfo>
#include "profilereader.h"
#include "parseproconfig.h"

void printUsage(const QString &fileName)
{
    qDebug()<<QString("usage: %1 [src path] [dst path]").arg(fileName);
    qDebug()<<QString("     This tool is used to convert pro files into pri files.");
}

void loadDataToProFileReader(const QString &filPath, ProFileReader &proFileReader)
{
    QFile file(filPath);
    if(!file.open(QIODevice::ReadOnly)) {
        qDebug()<<"error: load sources file failed";
        return;
    }
    while(!file.atEnd()) {
        proFileReader.loadOneRowOfData(QString(file.readLine()));
    }
    file.close();
}

void convertedToPri(const QString &dstPath, const QStringList &configList)
{
    ParseProConfig parseProConfig;

    QFile output(dstPath);
    if(!output.open(QIODevice::WriteOnly)) {
        qDebug()<<"error: create destination file failed";
        return;
    }

    for(int i=0;i<configList.length();i++) {
        QString convertConfig = parseProConfig.convertOneConfig(configList.at(i));
        QByteArray dataLine = convertConfig.toLatin1();
        output.write(dataLine);
    }
    output.close();
}

int main(int argc, char *argv[])
{
    if(argc != 3) {
        QFileInfo fileInfo(argv[0]);
        printUsage(fileInfo.fileName());
        return -1;
    }

    QString srcFilePath(argv[1]);
    QString dstFilePath(argv[2]);

    ProFileReader proFileReader;
    loadDataToProFileReader(srcFilePath, proFileReader);
    convertedToPri(dstFilePath, proFileReader.splitConfigFromData());

    qDebug()<<QString("Conversion of file from [%1] to [%2] succeeded").arg(argv[1]).arg(argv[2]);
}
