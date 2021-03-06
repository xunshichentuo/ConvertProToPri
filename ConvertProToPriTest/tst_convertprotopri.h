#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>
#include "convertprotopri.h"
#include "../ProToPriTool/parseproconfig.h"

using namespace testing;

QT_BEGIN_NAMESPACE
inline void PrintTo(const QString &qString, ::std::ostream *os) {
    *os << qPrintable(qString);
}
QT_END_NAMESPACE


class TestConvertProToPri : public Test {
public:
    ConvertProToPri *converter;
    ParseProConfig parseProConfig;
    void SetUp() override {

    }
    void TearDown() override {

    }
};

TEST_F(TestConvertProToPri, testFirstLine)
{
    QString firstLine = QString("QT += qml quick opengl serialport testlib xml websockets network\r\n");
    ASSERT_THAT(parseProConfig.convertOneConfig(firstLine), Eq(firstLine));
}

TEST_F(TestConvertProToPri, convertQMAKE_INFO_PLIST)
{
    QString beforeConverted = QString("QMAKE_INFO_PLIST = $$PWD/MacDeployment/Info.plist\r\n");
    QString expectedConverted = QString("QMAKE_INFO_PLIST = $$PWD/Moonray/MacDeployment/Info.plist\r\n");
    QString afterCovnerted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterCovnerted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, splitKeywordAndPath)
{
    QString beforeSplited = QString("HEADERS += \\\r\nActions/AutoOrient/Components/DentalModel/DentalModel.h \\\r\nActions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.h \\\r\n");
    QStringList expectedConverted{"Actions/AutoOrient/Components/DentalModel/DentalModel.h", "Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.h"};
    QStringList afterSplited = parseProConfig.getToBeConvertPathList(beforeSplited);
    ASSERT_THAT(afterSplited, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, convertTwoLineHEADERS)
{
    QString beforeConverted = QString("HEADERS += \\\r\nActions/AutoOrient/Components/DentalModel/DentalModel.h \\\r\n");
    QString expectedConverted = QString("HEADERS += \\\r\n$$PWD/Moonray/Actions/AutoOrient/Components/DentalModel/DentalModel.h \\\r\n");
    QString afterCovnerted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterCovnerted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, convertRESOURCESConfig)
{
    QString beforeConverted = QString("RESOURCES += \\\r\nqml.qrc \\\r\n$$PWD/ExternalExecutables\r\n");
    QString expectedConverted = QString("RESOURCES += \\\r\n$$PWD/Moonray/qml.qrc \\\r\n$$PWD/Moonray/ExternalExecutables\r\n");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, convertTRANSLATIONSConfig)
{
    QString beforeConverted = QString("TRANSLATIONS += \\\r\nTranslations/lang_zh_CN.ts \\\r\nTranslations/lang_en_US.ts");
    QString expectedConverted = QString("TRANSLATIONS += \\\r\n$$PWD/Moonray/Translations/lang_zh_CN.ts \\\r\n$$PWD/Moonray/Translations/lang_en_US.ts");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, convertSOURCESConfig)
{
    QString beforeConverted = QString("SOURCES += main.cpp \\\r\nActions/AutoOrient/Components/DentalModel/DentalModel.cpp \\\r\nActions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.cpp \\\r\n");
    QString expectedConverted = QString("SOURCES += $$PWD/Moonray/main.cpp \\\r\n$$PWD/Moonray/Actions/AutoOrient/Components/DentalModel/DentalModel.cpp \\\r\n$$PWD/Moonray/Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.cpp \\\r\n");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, dontChangedLIBSConfig)
{
    QString beforeConverted = QString("LIBS += -lopengl32\r\n");
    QString expectedConverted = QString("LIBS += -lopengl32\r\n");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, needChangedLIBSConfig)
{
    QString beforeConverted = QString("LIBS += -L$$PWD/Actions/SprFileReaderAndWriter/CompressionLibrary/zlib -lzlib");
    QString expectedConverted = QString("LIBS += -L$$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/zlib -lzlib");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, changeRC_ICONSConfig)
{
    QString beforeConverted = QString("RC_ICONS += logo_icon.ico");
    QString expectedConverted = QString("RC_ICONS += $$PWD/Moonray/logo_icon.ico");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, convertSOURCESConfigWithBlankSpace)
{
    QString beforeConverted = QString("SOURCES += main.cpp \\\r\n    Actions/AutoOrient/Components/DentalModel/DentalModel.cpp \\\r\nActions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.cpp \\\r\n");
    QString expectedConverted = QString("SOURCES += $$PWD/Moonray/main.cpp \\\r\n    $$PWD/Moonray/Actions/AutoOrient/Components/DentalModel/DentalModel.cpp \\\r\n$$PWD/Moonray/Actions/AutoOrient/Components/SurgicalGuide/SurgicalGuide.cpp \\\r\n");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}

TEST_F(TestConvertProToPri, fullNameOfFileContainedInAnotherFileName)
{
    QString beforeConverted = QString("SOURCES += main.cpp \\\r\n    Actions/SprFileReaderAndWriter/CompressionLibrary/quazip_global.h \\\r\n    global.h\r\n\r\n");
    QString expectedConverted = QString("SOURCES += $$PWD/Moonray/main.cpp \\\r\n    $$PWD/Moonray/Actions/SprFileReaderAndWriter/CompressionLibrary/quazip_global.h \\\r\n    $$PWD/Moonray/global.h\r\n\r\n");

    QString afterConverted = parseProConfig.convertOneConfig(beforeConverted);
    ASSERT_THAT(afterConverted, Eq(expectedConverted));
}
