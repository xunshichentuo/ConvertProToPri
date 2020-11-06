#ifndef PARSEPROCONFIG_H
#define PARSEPROCONFIG_H

#include <QObject>
#include <QStringList>
#include <QString>

class ParseProConfig : public QObject
{
    Q_OBJECT
public:
    explicit ParseProConfig(QObject *parent = nullptr);

    QString convertOneConfig(const QString &waitConverted);
private:
    bool isNeedConvert(const QString &waitConverted);
public:
    QStringList getPathList(const QString &data);
private:
    bool libsConfigDontHasRungL(const QStringList &libConfig);
    bool containsRungLPath(const QStringList &configData);
    QStringList getBeConvertedRungLPath(const QStringList &configData);
    QStringList getBeConvertedNormalPath(const QStringList &configData);
    QString addPwdHeadPathInPaths(const QString &waitConverted, QStringList pathList);

private:
    QList<QString> hasPathKeywords;
};

#endif // PARSEPROCONFIG_H
