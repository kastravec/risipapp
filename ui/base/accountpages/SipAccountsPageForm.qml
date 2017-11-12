import QtQuick 2.7
import QtQuick.Controls 2.2

import "../risipcomponents"
import QtQuick.Layouts 1.0

Page {
    id: page

    signal cancelClicked
    property alias addSipAcountButton: addSipAccountButton
    property alias sipAccountsListview: sipAccountsListview
    property alias resetButton: resetButton

    anchors.bottomMargin: 37

    header: ToolBar {
        focus: true

        background: Rectangle {
            implicitHeight: 40
            color: "#ffffff"
        }

        Arrow {
            id: backArrowIcon
            orientation: "left"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }

        ToolButton {
            text: qsTr("Cancel")
            anchors.bottomMargin: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: backArrowIcon.right
            anchors.rightMargin: 10
            onClicked: root.cancelClicked()

            background: Rectangle {
                color: "#ffffff"
            }
        }
    }

    ColumnLayout {
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20
        anchors.fill: parent
        spacing: 20

        Label {
            id: label
            color: "#2b2626"
            text: qsTr("Manage SIP Accounts")
            anchors.bottomMargin: 0
            renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredWidth: 143
        }

        ListView {
            id: sipAccountsListview
            keyNavigationWraps: true
            snapMode: ListView.SnapOneItem
            clip: true
            spacing: 5
            Layout.fillHeight: true
            Layout.fillWidth: true

            delegate: Item {
                width: parent.width
                height: 50
                Row {
                    id: row1
                    spacing: 10

                    Text {
                        text: accountUri
                        font.bold: true
                    }
                }
            }
        }
        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            RisipButton {
                id: addSipAccountButton
                text: "Add SIP account"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 31
                Layout.preferredWidth: 115
                border.width: 1
                border.color: "#000000"
            }

            RisipButton {
                id: resetButton
                text: "Reset all"
                border.width: 1
                border.color: "#000000"

                Layout.preferredWidth: 115
                Layout.preferredHeight: 31
            }
        }
    }
}
