#ifndef PROFILEREADER_H
#define PROFILEREADER_H

#include <QObject>
#include <QStringList>

class ProFileReader : public QObject
{
    Q_OBJECT
public:
    explicit ProFileReader(QObject *parent = nullptr);

    QStringList splitConfigFromData(const QString &data);
signals:

public slots:
};

#endif // PROFILEREADER_H
