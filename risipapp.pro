##################################################################################
#    Copyright (C) 2016 - 2017 Petref Saraci
#    http://risip.io
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You have received a copy of the GNU General Public License
#    along with this program. See LICENSE.GPLv3
#    A copy of the license can be found also here <http://www.gnu.org/licenses/>.
#
###################################################################################

include(risip-voipsdk/risip-voipsdk.pri)

TEMPLATE = app
TARGET = RisipApp
DESTDIR = $$PWD/bin

QT += androidextras
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

SOURCES += src/main.cpp

RESOURCES += qml.qrc \
             images.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    risip-voipsdk/platforms/AndroidManifest.xml \
    risip-voipsdk/platforms/gradle/wrapper/gradle-wrapper.jar \
    risip-voipsdk/platforms/gradlew \
    risip-voipsdk/platforms/res/values/libs.xml \
    risip-voipsdk/platforms/build.gradle \
    risip-voipsdk/platforms/gradle/wrapper/gradle-wrapper.properties \
    risip-voipsdk/platforms/gradlew.bat \
    risip-voipsdk/platforms/android-platform/android/AndroidManifest.xml \
    risip-voipsdk/platforms/android-platform/android/gradle/wrapper/gradle-wrapper.jar \
    risip-voipsdk/platforms/android-platform/android/gradlew \
    risip-voipsdk/platforms/android-platform/android/res/values/libs.xml \
    risip-voipsdk/platforms/android-platform/android/build.gradle \
    risip-voipsdk/platforms/android-platform/android/gradle/wrapper/gradle-wrapper.properties \
    risip-voipsdk/platforms/android-platform/android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat
