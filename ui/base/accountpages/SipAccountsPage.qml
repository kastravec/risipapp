import QtQuick 2.7

import Risip 1.0

SipAccountsPageForm {
    id: root

    sipAccountsListview.model: Risip.allAccountsModel

    addSipAcountButton.onClicked: {
        addSipAccountPageLoader.active = true
        stackView.push(addSipAccountPageLoader.item)
    }

    resetButton.onClicked: {
        Risip.resetSettings()
    }

    Loader {
        id: addSipAccountPageLoader
        source: "qrc:/ui/base/accountpages/AddSipAccountPage.qml"
        active: false
    }

    Connections {
        target: addSipAccountPageLoader.item

        onCancelClicked: {
            stackView.pop()
            addSipAccountPageLoader.active = false
        }

        onSipAccountAdded: {
            stackView.pop()
            addSipAccountPageLoader.active = false
        }
    }
}
