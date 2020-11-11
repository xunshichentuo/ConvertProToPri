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
    QStringList removeAllSpace(const QStringList &data);
    QString removeSpace(const QString &data);
    bool containsHasLibConfigAndDontHasRungL(const QStringList &libConfig);
    bool containsRungLPath(const QStringList &configData);
    QStringList getBeConvertedRungLPath(const QStringList &configData);
    QStringList getBeConvertedNormalPath(const QStringList &configData);
    QString addPwdHeadPathInPaths(const QString &waitConverted, const QStringList &toBeConvertList);
    QVector<int> getStartPosSet(const QString &waitConverted, const QString &path);
    QString convertMatchingQString(const QString &waitConverted, const QString &matchingQString, QVector<int> &startPosSet);
    bool matchingQStringNeedToBeReplace(const QChar &characterBeforeConversion);
    QString getReplacePath(const QString &path);

private:
    QList<QString> hasPathKeywords;
};

#endif // PARSEPROCONFIG_H
