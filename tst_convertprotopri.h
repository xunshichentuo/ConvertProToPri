#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>
#include "convertprotopri.h"

using namespace testing;

QT_BEGIN_NAMESPACE
inline void PrintTo(const QString &qString, ::std::ostream *os) {
    *os << qPrintable(qString);
}
QT_END_NAMESPACE


class TestConvertProToPri : public Test {
public:
    QString srcFilePath = "/home/chen/Documents/qtProject/ConvertProToPri/rayware.pro";
    ConvertProToPri *converter;
    int expectSourceFileLineNumber = 638;
    int expectHEADERSLinePosition = 26;
    int expectSOURCESLinePosition = 300;
    int expectDISTFILESLinePosition = 603;
    int expectRESOURCESLinePosition = 632;
    int expectQMAKE_INFO_PLISTLinePosition = 20;
    void SetUp() override {
        converter = new ConvertProToPri(srcFilePath);
    }
    void TearDown() override {
        delete converter;
    }
};

TEST_F(TestConvertProToPri, testFirstLine)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    ASSERT_THAT(converter->convertOneLine(firstLine), Eq(firstLine));
}

TEST_F(TestConvertProToPri, convertQMAKE_INFO_PLIST)
{
    QString beforeConverted = QString("QMAKE_INFO_PLIST = $$PWD/MacDeployment/Info.plist\r\n");
    QString expectedConverted = QString("QMAKE_INFO_PLIST = $$PWD/Moonray/MacDeployment/Info.plist\r\n");
    QString afterCovnerted = converter->convertOneLine(beforeConverted);
    ASSERT_THAT(afterCovnerted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, DISABLED_requiredConversionUnderSpecifiedLineNumber)
{
    EXPECT_TRUE(converter->needConvert(expectQMAKE_INFO_PLISTLinePosition));
}

TEST_F(TestConvertProToPri, DISABLED_countProFileLineNumber)
{
    ASSERT_THAT(converter->getSourceFileLineNumber(srcFilePath), Eq(expectSourceFileLineNumber));
}
