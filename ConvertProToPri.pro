include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += thread

HEADERS +=     \
    convertprotopri.h \
    tst_convertprotopri.h

SOURCES +=     main.cpp \
    convertprotopri.cpp

RESOURCES += \
    res.qrc
