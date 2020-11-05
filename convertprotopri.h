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
    QString readOneLineFromSourceFile(const QString srcPath);
    int getSourceFileLineNumber(const QString srcPath);
    int getLineNumberOfHEADERS(const QString srcPath);
    int getLineNumberOfSOURCES(const QString srcPath);
    int getLineNumberOfDISTFILES(const QString srcPath);
    int getLineNumberOfRESOURCES(const QString srcPath);
private:
    int getFirstKeyWordLineNumber(const QString filePath, const QString keyword);
signals:

public slots:

private:
    QString proFilePath;
};

#endif // CONVERTPROTOPRI_H
