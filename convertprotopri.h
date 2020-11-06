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

    QString convertOneConfig(const QString &waitConverted);
    bool isNeedConvert(const QString &waitConverted);
    QString addPwdHeadPathInPaths(const QString &waitConverted, QStringList pathList);


    QString convertFile();
    QString convertNextLine();
    QString convertOneLine(const int index);
    bool needConvert(const int index);
    QString readOneLineFromSourceFile(const QString srcPath);
    int getSourceFileLineNumber(const QString srcPath);

private:
    void initKeyword();
    void loadSrcFile(const QString srcFilePath);
    bool isOpenSrcFile();
    bool isValidIndex(const int index);
    QString convertPwdPath(const QString &lineContent);
public:
    QStringList getPathList(const QString &data);
private:
    void moveToFileHead();
    void moveToSpecifiedLine(const int index);
    QString getSpecifiedLineContent(const int index);
    int getFirstKeyWordLineNumber(const QString filePath, const QString keyword);
    QString getFirstKeyWordLineData(const QString filePath, const QString keyword);
private:
    QString proFilePath;
    QList<QString> hasPathKeywords;
    QFile srcFile;
};

#endif // CONVERTPROTOPRI_H
