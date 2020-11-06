#ifndef PROFILEREADER_H
#define PROFILEREADER_H

#include <QObject>
#include <QStringList>

class ProFileReader : public QObject
{
    Q_OBJECT
public:
    explicit ProFileReader(QObject *parent = nullptr);

    void loadOneRowOfData(const QString &rowData);
    QStringList splitConfigFromData();

    QStringList tempStroageDataList;
    QStringList configList;
};

#endif // PROFILEREADER_H
