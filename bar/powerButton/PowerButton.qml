import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils

Item {
    id: root
    property alias menu: powerMenu
    implicitWidth: powerButton.implicitWidth

    Button {
        id: powerButton

        icon.source: "../../icons/power.svg"
        icon.color: Scheme.textOnPrimary
        icon.height: root.height * 0.8
        icon.width: root.height * 0.8

        background: Rectangle {
            implicitWidth: powerButton.height * 1.618
            implicitHeight: root.height
            color: Scheme.primary
            border.color: Scheme.outlineVariant
            border.width: 1
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

