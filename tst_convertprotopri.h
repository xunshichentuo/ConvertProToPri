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

TEST_F(TestConvertProToPri, countProFileLineNumber)
{
    ASSERT_THAT(converter->getSourceFileLineNumber(srcFilePath), Eq(expectSourceFileLineNumber));
}

TEST_F(TestConvertProToPri, countProFileHEADERSLineNumber)
{
    ASSERT_THAT(converter->getLineNumberOfHEADERS(srcFilePath), Eq(expectHEADERSLinePosition));
}

TEST_F(TestConvertProToPri, countProFileSOURCESLineNumber)
{
    ASSERT_THAT(converter->getLineNumberOfSOURCES(srcFilePath), Eq(expectSOURCESLinePosition));
}

TEST_F(TestConvertProToPri, countProFileDISTFILESLineNumber)
{
    ASSERT_THAT(converter->getLineNumberOfDISTFILES(srcFilePath), Eq(expectDISTFILESLinePosition));
}

TEST_F(TestConvertProToPri, countProFileRESOURCESLineNumber)
{
    ASSERT_THAT(converter->getLineNumberOfRESOURCES(srcFilePath), Eq(expectRESOURCESLinePosition));
}

TEST_F(TestConvertProToPri, countProFileQMAKE_INFO_PLISTLineNumber)
{
    ASSERT_THAT(converter->getLineNumberOfQMAKEINFOPLIST(srcFilePath), Eq(expectQMAKE_INFO_PLISTLinePosition));
}

TEST_F(TestConvertProToPri, convertQMAKE_INFO_PLISTLine)
{
    QString expectQMAKE_INFO_PLISTResult = "QMAKE_INFO_PLIST = $$PWD/Moonray/MacDeployment/Info.plist\r\n";
    ASSERT_THAT(converter->convertQMAKEINFOPLIST(srcFilePath), Eq(expectQMAKE_INFO_PLISTResult));
}

TEST_F(TestConvertProToPri, convertQMAKE_INFO_PLISTRow)
{
    QString expectQMAKE_INFO_PLISTResult = "QMAKE_INFO_PLIST = $$PWD/Moonray/MacDeployment/Info.plist\r\n";
    ASSERT_THAT(converter->convertOneLine(expectQMAKE_INFO_PLISTLinePosition), expectQMAKE_INFO_PLISTResult);
}
