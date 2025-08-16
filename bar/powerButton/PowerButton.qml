import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils

Item {
    id: root
    property alias menu: powerMenu

    Button {
        id: powerButton

        icon.source: "../../icons/power.svg"
        icon.color: Scheme.textOnPrimary
        icon.height: root.height * 0.8
        icon.width: root.height * 0.8

        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0

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

