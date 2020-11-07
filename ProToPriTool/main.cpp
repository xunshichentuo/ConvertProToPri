#include <QCoreApplication>
#include <QFile>
#include <QDebug>
#include "profilereader.h"
#include "parseproconfig.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QFile file("/home/chen/Documents/qtProject/ConvertProToPri/ConvertProToPriTest/rayware.pro");
    if(!file.open(QIODevice::ReadOnly))
        return -1;

    ProFileReader proFileReader;
    while(!file.atEnd()) {
        proFileReader.loadOneRowOfData(QString(file.readLine()));
    }
    file.close();

    QStringList configList = proFileReader.splitConfigFromData();

    QFile waitForConverting("./waitConverted");
    if(waitForConverting.open(QIODevice::WriteOnly)) {
        for(int i=0;i<configList.length();i++) {
            waitForConverting.write(configList.at(i).toLatin1());
        }
        waitForConverting.close();
    }

    ParseProConfig parseProConfig;

    QFile output("./output");
    if(!output.open(QIODevice::WriteOnly)) {
        return -1;
    }

    qDebug()<<"===========================================";
    for(int i=0;i<configList.length();i++) {
        qDebug()<<"===========================================";
        qDebug()<<"config.at("<<i<<"):"<<configList.at(i);
        qDebug()<<"===========================================";
        QString convertConfig = parseProConfig.convertOneConfig(configList.at(i));
        qDebug()<<"===========================================";
        qDebug()<<"convertConfig"<<i<<":"<<convertConfig;
        QByteArray dataLine = convertConfig.toLatin1();
        output.write(dataLine);
    }
    output.close();

    return a.exec();
}
