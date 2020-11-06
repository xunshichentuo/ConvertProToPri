#ifndef CONVERTPROTOPRI_H
#define CONVERTPROTOPRI_H

#include <QObject>
#include <QFile>
#include <QDebug>

class ConvertProToPri : public QObject
{
    Q_OBJECT
public:
    explicit ConvertProToPri(QObject *parent = nullptr);
    explicit ConvertProToPri(const QString srcFilePath, QObject *parent = nullptr);
private:
    QString proFilePath;
    QFile srcFile;
    QStringList configList;
};

#endif // CONVERTPROTOPRI_H
