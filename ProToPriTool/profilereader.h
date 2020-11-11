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
    QString filterUnwantedContent(const QString &rowData);
    QStringList getTempStroageDataList() const;
    QStringList splitConfigFromData();
    bool isTempStroageContainedEqualSign(const int &index);
    void reserveNotContainedEqualSignLines(QStringList &configList, const int &index);
    bool isTempStroageNeedReserved(const int &index);
    bool isEmptyLine(const QString &lineData);
    bool isLastConfigFinished(const QStringList &configList);
    QVector<int> getConfigStartIndex(const QStringList &data);
    QStringList tempStroageDataList;
    QStringList configList;
};

#endif // PROFILEREADER_H
