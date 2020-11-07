#ifndef PARSEPROCONFIG_H
#define PARSEPROCONFIG_H

#include <QObject>
#include <QStringList>
#include <QString>
#include <QDebug>

class ParseProConfig : public QObject
{
    Q_OBJECT
public:
    explicit ParseProConfig(QObject *parent = nullptr);

    QString convertOneConfig(const QString &waitConverted);
    QStringList getToBeConvertPathList(const QString &data);
private:
    bool isNeedConvert(const QString &waitConverted);
    QStringList removeAllFrontBlank(const QStringList &data);
    QString removeFrontBlank(const QString &data);
    bool containsHasLibConfigAndDontHasRungL(const QStringList &libConfig);
    bool containsRungLPath(const QStringList &configData);
    QStringList getBeConvertedRungLPath(const QStringList &configData);
    QStringList getBeConvertedNormalPath(const QStringList &configData);
    QString addPwdHeadPathInPaths(const QString &waitConverted, QStringList toBeConvertList);

private:
    QList<QString> hasPathKeywords;
};

#endif // PARSEPROCONFIG_H
