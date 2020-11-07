#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>
#include "../ProToPriTool/profilereader.h"

#include <QStringList>
#include <QVector>

using namespace testing;


class TestProfileReader : public Test {
public:
    ProFileReader proFileReader;
};

TEST_F(TestProfileReader, testFirstTwoLineConfig)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    QString secondLine = QString("CONFIG += c++11");
    QStringList expectEachConfig;
    expectEachConfig.append(firstLine);
    expectEachConfig.append(secondLine);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    QStringList afterCovnerted = proFileReader.splitConfigFromData();
    ASSERT_THAT(afterCovnerted, Eq(QStringList(expectEachConfig)));
}

TEST_F(TestProfileReader, testConfigStartIndex)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    QString secondLine = QString("CONFIG += c++11\r\n");

    QVector<int> expectConfigStartIndex;
    expectConfigStartIndex.append(0);
    expectConfigStartIndex.append(1);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);

    QVector<int> actualStartIndex = proFileReader.getConfigStartIndex(proFileReader.getTempStroageDataList());
    ASSERT_THAT(actualStartIndex, Eq(expectConfigStartIndex));
}

TEST_F(TestProfileReader, testFitstThreeLineConfig)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    QString secondLine = QString("CONFIG += c++11\r\n");
    QString thirdLine = QString("QT.testlib.CONFIG -= console\r\n");

    QStringList expectedConverted;
    expectedConverted.append(firstLine);
    expectedConverted.append(secondLine);
    expectedConverted.append(thirdLine);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    proFileReader.loadOneRowOfData(thirdLine);
    QStringList afterConverted = proFileReader.splitConfigFromData();
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestProfileReader, getEachConfigFromDataList)
{
    QString firstLine = QString("QT += qml quick opengl serialport \\\r\n");
    QString secondLine = QString("testlib xml websockets network\r\n");
    QString thirdLine = QString("CONFIG += c++11\r\n");

    QStringList expectEachConfig;
    expectEachConfig.append(firstLine+ secondLine);
    expectEachConfig.append(thirdLine);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    proFileReader.loadOneRowOfData(thirdLine);
    QStringList afterConverted = proFileReader.splitConfigFromData();

    ASSERT_THAT(afterConverted, Eq(expectEachConfig));
}

TEST_F(TestProfileReader, getEachConfigFromDataListWithBlankLine)
{
    QString firstLine = QString("QT += qml quick opengl serialport \\\r\n");
    QString secondLine = QString("testlib xml websockets network\r\n");
    QString thirdLine = QString("\r\n");
    QString fourthLine = QString("CONFIG += c++11\r\n");

    QStringList expectEachConfig;
    expectEachConfig.append(firstLine+ secondLine+thirdLine);
    expectEachConfig.append(fourthLine);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    proFileReader.loadOneRowOfData(thirdLine);
    proFileReader.loadOneRowOfData(fourthLine);
    QStringList afterConverted = proFileReader.splitConfigFromData();

    ASSERT_THAT(afterConverted, Eq(expectEachConfig));
}

TEST_F(TestProfileReader, mustReserveComments)
{
    QString firstLine = QString("#Application version\r\n");
    QString secondLine = QString("VERSION_MAJOR = 2\r\n");
    QString thirdLine = QString("VERSION_MINOR = 6\r\n");
    QString fourthLine = QString("VERSION_REVISION = 6\r\n");
    QString fifthLine = QString("VERSION_BUILD = 1\r\n");

    QStringList expectEachConfig;
    expectEachConfig.append(firstLine);
    expectEachConfig.append(secondLine);
    expectEachConfig.append(thirdLine);
    expectEachConfig.append(fourthLine);
    expectEachConfig.append(fifthLine);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    proFileReader.loadOneRowOfData(thirdLine);
    proFileReader.loadOneRowOfData(fourthLine);
    proFileReader.loadOneRowOfData(fifthLine);
    QStringList afterConverted = proFileReader.splitConfigFromData();

    ASSERT_THAT(afterConverted, Eq(expectEachConfig));
}

TEST_F(TestProfileReader, reserveCurlyBrackets)
{
    QString firstLine = QString("win32 {\r\n");
    QString secondLine = QString("    HEADERS +=  Networking/WinSSH/libsshwin64wrapper.h \\\r\n");
    QString thirdLine = QString("                Networking/WinSSH/winsshclient.h \r\n");
    QString fourthLine = QString("}\r\n");

    QStringList expectEachConfig;
    expectEachConfig.append(firstLine);
    expectEachConfig.append(secondLine+thirdLine);
    expectEachConfig.append(fourthLine);

    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    proFileReader.loadOneRowOfData(thirdLine);
    proFileReader.loadOneRowOfData(fourthLine);
    QStringList afterConverted = proFileReader.splitConfigFromData();
    ASSERT_THAT(afterConverted, Eq(expectEachConfig));
}
