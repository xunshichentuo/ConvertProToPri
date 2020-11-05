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
    ConvertProToPri converter;
    QString srcFilePath = "/home/chen/Documents/qtProject/ConvertProToPri/rayware.pro";
};

TEST_F(TestConvertProToPri, testFirstLine)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    ASSERT_THAT(converter.readOneLineFromSourceFile(srcFilePath), Eq(firstLine));
}

TEST_F(TestConvertProToPri, countProFileLineNumber)
{
    ASSERT_THAT(converter.getSourceFileLineNumber(srcFilePath), Eq(638));
}

TEST_F(TestConvertProToPri, countProFileHEADERSLineNumber)
{
    ASSERT_THAT(converter.getSrcFileHEADERSLineNumber(srcFilePath), Eq(26));
}

TEST_F(TestConvertProToPri, countProFileSOURCESLineNumber)
{
    ASSERT_THAT(converter.getSrcFileSOURCESLineNumber(srcFilePath), Eq(300));
}
