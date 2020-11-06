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
    ASSERT_THAT(converter->convertOneLine(1), Eq(firstLine));
}

TEST_F(TestConvertProToPri, DISABLED_requiredConversionUnderSpecifiedLineNumber)
{
    EXPECT_TRUE(converter->needConvert(expectQMAKE_INFO_PLISTLinePosition));
}

TEST_F(TestConvertProToPri, countProFileLineNumber)
{
    ASSERT_THAT(converter->getSourceFileLineNumber(srcFilePath), Eq(expectSourceFileLineNumber));
}
