######################################################################
# Automatically generated by qmake (2.01a) Thu Jan 12 15:10:36 2012
######################################################################

CONFIG -= qt

TEMPLATE = lib
TARGET = 
DEPENDPATH += .
INCLUDEPATH += .
QMAKE_CXXFLAGS += -Wno-unused-parameter

unix: CONFIG += link_pkgconfig
unix: PKGCONFIG += glibmm-2.4 guile-2.0 libxml++-2.6

# Input
SOURCES += guile-xmlreader.cpp
