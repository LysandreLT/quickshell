import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils

Item {
    id: root
    property alias menu: powerMenu
    Layout.fillHeight: true

    Button {
        id: powerButton
        Layout.fillHeight: true
        width: height * 1.618

        icon.source: "../../icons/power.svg"
        icon.color: Scheme.textOnPrimary

        icon.width: root.height * 0.8
        icon.height: root.height * 0.8

        background: Rectangle {
            anchors.fill: parent
            color: Scheme.primary
            radius: 4
        }

        onClicked: root.menu.visible = !root.menu.visible
    }

    PowerMenu {
        id: powerMenu
        anchors.top: powerButton.bottom
        anchors.left: powerButton.left
    }
}

