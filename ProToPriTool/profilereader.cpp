#include "profilereader.h"

ProFileReader::ProFileReader(QObject *parent) : QObject(parent)
{

}

void ProFileReader::loadOneRowOfData(const QString &rowData)
{
    tempStroageDataList.append(rowData);
}

QStringList ProFileReader::getTempStroageDataList() const
{
    return tempStroageDataList;
}

QStringList ProFileReader::splitConfigFromData()
{
    if(tempStroageDataList.length() < 1) return QStringList();

    QStringList configList;
    for(int i=0;i<tempStroageDataList.length();i++) {
        if(tempStroageDataList.at(i).contains("=")) {
            configList.append(tempStroageDataList.at(i));
        }
    }
    return configList;
}

QVector<int> ProFileReader::getConfigStartIndex(const QStringList &data)
{
    int dataLength = data.length();
    if(dataLength < 1) return QVector<int>();
    QVector<int> startIndex;
    for(int i=0;i<dataLength;i++) {
        if(data.at(i).contains("="))
            startIndex.append(i);
    }
    return startIndex;
}
