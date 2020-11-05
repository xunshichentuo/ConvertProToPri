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
    int getSrcFileHEADERSLineNumber(const QString srcPath);
    int getSrcFileSOURCESLineNumber(const QString srcPath);
    int getSrcFileDISTFILESLineNumber(const QString srcPath);
private:
    int getFirstKeyWordLineNumber(const QString filePath, const QString keyword);
signals:

public slots:

private:
    QString proFilePath;
};

#endif // CONVERTPROTOPRI_H
