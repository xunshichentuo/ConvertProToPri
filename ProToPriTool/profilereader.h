#ifndef PROFILEREADER_H
#define PROFILEREADER_H

#include <QObject>
#include <QStringList>
#include <QVector>

class ProFileReader : public QObject
{
    Q_OBJECT
public:
    explicit ProFileReader(QObject *parent = nullptr);

    void loadOneRowOfData(const QString &rowData);
    QStringList getTempStroageDataList() const;
    QStringList splitConfigFromData();

    QVector<int> getConfigStartIndex(const QStringList &data);
    QStringList tempStroageDataList;
    QStringList configList;
};

#endif // PROFILEREADER_H
