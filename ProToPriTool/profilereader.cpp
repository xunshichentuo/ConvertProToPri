#include "profilereader.h"

ProFileReader::ProFileReader(QObject *parent) : QObject(parent)
{

}

void ProFileReader::loadOneRowOfData(const QString &rowData)
{
    tempStroageDataList.append(rowData);
}

QStringList ProFileReader::splitConfigFromData()
{
    if(tempStroageDataList.length() < 1) return QStringList();
    configList.append(tempStroageDataList.first());
    tempStroageDataList.removeFirst();
    return configList;
}
