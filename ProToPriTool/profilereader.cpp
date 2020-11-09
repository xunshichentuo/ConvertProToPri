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
    if(tempStroageDataList.length() < 1) {
        qDebug()<<"tempStroageDataList.length() < 1";
        return QStringList();
    }

    QStringList configList;
    for(int i=0;i<tempStroageDataList.length();i++) {
        if(isTempStroageContainedEqualSign(i)) {
            configList.append(tempStroageDataList.at(i));
        } else if(!isTempStroageContainedEqualSign(i)
                  && isLastConfigFinished(configList)) {
            configList.last().append(tempStroageDataList.at(i));
        } else if(!isTempStroageContainedEqualSign(i) &&
                  isTempStroageNeedReserved(i)) {
            configList.append(tempStroageDataList.at(i));
        }
    }
    return configList;
}

bool ProFileReader::isTempStroageContainedEqualSign(const int &index)
{
    if(index >=0 && index >= tempStroageDataList.length()) return false;
    return tempStroageDataList.at(index).contains("=");
}

bool ProFileReader::isTempStroageNeedReserved(const int &index)
{
    if(index >=0 && index >= tempStroageDataList.length()) return false;
    QString value = tempStroageDataList.at(index);
    return value.contains("{") || value.contains("}") || value.contains("#") || isEmptyLine(value);
}

bool ProFileReader::isEmptyLine(const QString &lineData)
{
    QRegExp reg("\\s*");
    return reg.exactMatch(lineData);
}

bool ProFileReader::isLastConfigFinished(const QStringList &configList)
{
    if(configList.length() < 1)
        return false;

    QStringList lastLineConfig = configList.last().split("\r\n");
    lastLineConfig.removeAll("");
    if(lastLineConfig.length() < 1) return false;
    return (lastLineConfig.last().contains("\\"));
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
