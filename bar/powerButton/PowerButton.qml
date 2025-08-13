import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils

Item {
    id: root
    property alias menu: powerMenu

    Layout.alignment: Qt.AlignTop

    Button {
        id: powerButton
        icon.source: "../../icons/power.svg"
        icon.color: Scheme.textOnPrimary
        background: Rectangle {
            implicitHeight: 30
            implicitWidth: 50
            color: Scheme.primary
        }
        onClicked: root.menu.visible = !root.menu.visible
    }

    PowerMenu {
        id: powerMenu
        anchors.top: powerButton.bottom
        anchors.left: powerButton.left
    }
}
