CONFIG += c++11
CONFIG += link_prl

DEFINES += RISIP_SDK \
           PJ_IS_LITTLE_ENDIAN=1 \
           PJ_IS_BIG_ENDIAN=0 \
           PJ_AUTOCONF \
           QT_DEPRECATED_WARNINGS

QT = gui \
     core \
     network \
     qml \
     quick \
     quickcontrols2 \
     positioning \
     location

INCLUDEPATH += $$PWD/src/risipsdk/headers

macx {
include(platforms/macos/macplatform.pri)
CONFIG += app_bundle

LIBS += -L$$PWD/platforms/macos/bin \
        -lrisip
}

ios {
include(platforms/ios/iosplatform.pri)

LIBS += -L$$PWD/platforms/ios/bin \
        -lrisip
}

android {
include(platforms/android-platform/androidplatform.pri)

LIBS += -L$$PWD/platforms/android-platform/bin \
        -lrisip
}

linux {
include(platforms/linux/linuxplatform.pri)

LIBS += -L$$PWD/platforms/linux/bin \
        -lrisip
}

win32 {
include(platforms/win/winplatform.pri)

LIBS += -L$$PWD/platforms/win/bin \
        -lrisip
}
