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

TEST_F(TestProfileReader, DISABLED_getEachConfigFromDataList)
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
