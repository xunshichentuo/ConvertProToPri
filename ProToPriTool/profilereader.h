#ifndef PROFILEREADER_H
#define PROFILEREADER_H

#include <QObject>
#include <QStringList>
#include <QVector>
#include <QDebug>

class ProFileReader : public QObject
{
    Q_OBJECT
public:
    explicit ProFileReader(QObject *parent = nullptr);

    void loadOneRowOfData(const QString &rowData);
    QStringList getTempStroageDataList() const;
    QStringList splitConfigFromData();
    bool isTempStroageContainedEqualSign(const int &index);
    bool isTempStroageNeedReserved(const int &index);
    bool isTempStroageContainedPoundSign(const int &index);
    bool isTempStroageContainedCurlyBracketsSign(const int &index);
    bool isConfigListBeingAddedSubLine(const QStringList &configList);
    QVector<int> getConfigStartIndex(const QStringList &data);
    QStringList tempStroageDataList;
    QStringList configList;
};

#endif // PROFILEREADER_H
