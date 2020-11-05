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

    QString convertFile();
    QString convertOneLine(const int index);

    QString readOneLineFromSourceFile(const QString srcPath);
    int getSourceFileLineNumber(const QString srcPath);
    int getLineNumberOfHEADERS(const QString srcPath);
    int getLineNumberOfSOURCES(const QString srcPath);
    int getLineNumberOfDISTFILES(const QString srcPath);
    int getLineNumberOfRESOURCES(const QString srcPath);
    int getLineNumberOfQMAKEINFOPLIST(const QString srcPath);
    QString convertQMAKEINFOPLIST(const QString srcPath);
private:
    void loadSrcFile(const QString srcFilePath);
    bool isOpenSrcFile();
    bool isValidIndex(const int index);
    QString getSpecifiedLineContent(const int index);
    int getFirstKeyWordLineNumber(const QString filePath, const QString keyword);
    QString getFirstKeyWordLineData(const QString filePath, const QString keyword);
signals:

public slots:

private:
    QString proFilePath;
    QList<QString> keywordList;
    QFile srcFile;
};

#endif // CONVERTPROTOPRI_H
