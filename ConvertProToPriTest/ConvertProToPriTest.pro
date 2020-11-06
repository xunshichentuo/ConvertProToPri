include(gtest_dependency.pri)

TARGET = ConvertProToPriTest
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += thread

HEADERS +=     \
    convertprotopri.h \
    tst_convertprotopri.h \
    ../ProToPriTool/parseproconfig.h

SOURCES +=     main.cpp \
    convertprotopri.cpp \
    ../ProToPriTool/parseproconfig.cpp

RESOURCES += \
    res.qrc
