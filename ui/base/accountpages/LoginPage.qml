/***********************************************************************************
**    Copyright (C) 2016  Petref Saraci
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
import QtQuick.Controls.Material 2.1

import Risip 1.0

LoginPageForm {
    id: root

    Material.theme: Material.Light
    Material.background: "#FFFFFF"
    Material.accent: "#db0000" //"#DB5AB9"
    Material.foreground: "#000000"
    Material.primary: "#FFFFFF"

    sipAccountsCombobox.model: Risip.allAccountsModel

    property RisipAccount sipAccount: Risip.defaultAccount
    signal signedIn

    sipAccountsCombobox.onActivated: {
        sipAccount = Risip.accountForUri(sipAccountsCombobox.currentText)
        uernameInput.text = sipAccount.configuration.userName
        passwordInput.text = sipAccount.configuration.password

        Risip.setDefaultAccount(sipAccount.configuration.uri)
    }

    allSipAccountsButton.onClicked: {
        sipAccountsPageLoader.active = true
        stackView.push(sipAccountsPageLoader.item)
    }

    loginButton.onClicked: {
        sipAccount.login()
    }

    Loader {
        id: sipAccountsPageLoader
        source: "qrc:/ui/base/accountpages/SipAccountsPage.qml"
        active: false
    }

    Connections {
        target: sipAccountsPageLoader.item
        onCancelClicked: {
            stackView.pop()
            sipAccountsPageLoader.active = false
        }
    }
}
