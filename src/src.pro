#include(../qhttpserver.pri)

QHTTPSERVER_BASE = ..
TEMPLATE = lib

TARGET = QHttpServer

!win32:VERSION = 0.1.0

QT += network
QT -= gui

CONFIG += dll debug_and_release
CONFIG += dll
#CONFIG += staticlib

CONFIG(debug, debug|release) {
   # win32: TARGET = $$join(TARGET,,,d)
}

DEFINES += QHTTPSERVER_EXPORT

INCLUDEPATH += $$QHTTPSERVER_BASE/http-parser

PRIVATE_HEADERS += $$QHTTPSERVER_BASE/http-parser/http_parser.h QHttpConnection.h

PUBLIC_HEADERS += QHttpServer.h QHttpRequest.h QHttpResponse.h QHttpServerApi.h QHttpServerFwd.h

HEADERS = $$PRIVATE_HEADERS $$PUBLIC_HEADERS
SOURCES = *.cpp $$QHTTPSERVER_BASE/http-parser/http_parser.c

target.path = $$[QT_INSTALL_PREFIX]/lib
headers.files = $$PUBLIC_HEADERS
headers.path = $$[QT_INSTALL_PREFIX]/include/QHttpServer

INSTALLS += target headers
