#include "profilereader.h"

ProFileReader::ProFileReader(QObject *parent) : QObject(parent)
{

}

void ProFileReader::loadOneRowOfData(const QString &rowData)
{
    tempStroageDataList.append(filterUnwantedContent(rowData));
}

QString ProFileReader::filterUnwantedContent(const QString &rowData)
{
    QString inputData = rowData;
    if(inputData.contains("main.cpp")) {
        inputData.replace("main.cpp", "");
    } else if(inputData.contains("TARGET")) {
        inputData = "\r\n";
    }
    return inputData;
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
        } else {
            reserveNotContainedEqualSignLines(configList, i);
        }
    }
    return configList;
}

bool ProFileReader::isTempStroageContainedEqualSign(const int &index)
{
    if(index >=0 && index >= tempStroageDataList.length()) return false;
    return tempStroageDataList.at(index).contains("=");
}

void ProFileReader::reserveNotContainedEqualSignLines(QStringList &configList, const int &index)
{
    if(isLastConfigFinished(configList)) {
        configList.last().append(tempStroageDataList.at(index));
    } else if(isTempStroageNeedReserved(index)) {
        configList.append(tempStroageDataList.at(index));
    }
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
