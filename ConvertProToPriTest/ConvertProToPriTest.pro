include(gtest_dependency.pri)

TARGET = ConvertProToPriTest
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += thread

HEADERS +=     \
    convertprotopri.h \
    tst_convertprotopri.h \
    ../ProToPriTool/parseproconfig.h \
    tst_profilereader.h \
    ../ProToPriTool/profilereader.h

SOURCES +=     main.cpp \
    convertprotopri.cpp \
    ../ProToPriTool/parseproconfig.cpp \
    ../ProToPriTool/profilereader.cpp

RESOURCES += \
    res.qrc
