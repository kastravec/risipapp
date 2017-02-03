/***********************************************************************************
**    Copyright (C) 2016  Petref Saraci
**    http://risip.io
**
**    This program is free software: you can redistribute it and/or modify
**    it under the terms of the GNU General Public License as published by
**    the Free Software Foundation, either version 3 of the License, or
**    (at your option) any later version.
**
**    This program is distributed in the hope that it will be useful,
**    but WITHOUT ANY WARRANTY; without even the implied warranty of
**    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**    GNU General Public License for more details.
**
**    You have received a copy of the GNU General Public License
**    along with this program. See LICENSE.GPLv3
**    A copy of the license can be found also here <http://www.gnu.org/licenses/>.
**
************************************************************************************/

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    width: 200
    height: 100

    property alias textInput: textInput
    property alias text: textInput.text
    property alias placeholderText: textInput.placeholderText
    property alias showMagnifyIcon: searchIcon.visible
    property int frameBorder: 0
    property alias font: textInput.font
    property alias echoMode: textInput.echoMode
    property alias horizontalAlignment: textInput.horizontalAlignment

    Rectangle {
        id: frame
        border.width: frameBorder
        anchors.fill: parent
        anchors.margins: 15

        Image {
            id: searchIcon
            width: 22
            height: 22
            visible: false
            source: "qrc:/images/icons/128/MagnifyingGlassBlack.png"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }

        TextField {
            id: textInput
            anchors.left: searchIcon.right
            anchors.leftMargin: 10
            anchors.right: clearIcon.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            clip: true

            onTextChanged: {
                if(text.length > 0)
                    root.state = "base";
                else
                    root.state = "active";
            }
        }

        Image {
            id: clearIcon
            width: 12
            height: 12
            source: "qrc:/images/icons/128/CancelBlack.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            visible: false

            MouseArea {
                id: mousearea
                anchors.fill: parent
                anchors.margins: -10
                onClicked: textInput.remove(textInput.length -1, textInput.length);
                onPressAndHold: textInput.clear();
            }
        }
    }

    states: [
        State {
            name: "active"

            PropertyChanges {
                target: frame
                border.color: "#db0000"
            }

            PropertyChanges {
                target: clearIcon
                visible: true
                source: "qrc:/images/icons/128/CancelRed.png";
            }

            PropertyChanges {
                target: searchIcon
                source: "qrc:/images/icons/128/MagnifyingGlassRed.png"
            }
        }
    ]

    onTextChanged: {
        if(text)
            root.state = "active"; //searchIcon.source = "qrc:/images/icons/128/MagnifyingGlassRed.png";
        else
            root.state = "base"; //searchIcon.source = "qrc:/images/icons/128/MagnifyingGlassBlack.png";
    }
}
