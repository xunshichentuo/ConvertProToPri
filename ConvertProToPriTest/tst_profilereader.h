#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>
#include "../ProToPriTool/profilereader.h"

#include <QStringList>

using namespace testing;


class TestProfileReader : public Test {
public:
    ProFileReader proFileReader;
};

TEST_F(TestProfileReader, testFirstTwoLineConfig)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    QString secondLine = QString("CONFIG += c++11");
    proFileReader.loadOneRowOfData(firstLine);
    proFileReader.loadOneRowOfData(secondLine);
    QStringList afterCovnerted = proFileReader.splitConfigFromData();
    ASSERT_THAT(afterCovnerted, Eq(QStringList(firstLine)));
}

