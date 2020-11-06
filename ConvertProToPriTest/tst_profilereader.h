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
    QString beforeConverted = QString("QT += qml quick opengl serialport testlib xml websockets network\r\nCONFIG += c++11");
    QStringList expectedConverted;
    expectedConverted.append(QString("QT += qml quick opengl serialport testlib xml websockets network\r\n"));
    expectedConverted.append(QString("CONFIG += c++11"));
    QStringList afterCovnerted = proFileReader.splitConfigFromData(beforeConverted);
    ASSERT_THAT(afterCovnerted, Eq(expectedConverted));
}

