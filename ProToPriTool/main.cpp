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
//    qDebug()<<"configList:"<<configList;


    ParseProConfig parseProConfig;

    QFile output("./output");
    if(!output.open(QIODevice::WriteOnly)) {
        return -1;
    }

    for(int i=0;i<configList.length();i++) {
        output.write(parseProConfig.convertOneConfig(configList.at(i)).toLatin1());
    }
    output.close();

    return a.exec();
}
