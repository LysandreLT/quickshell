import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.utils

Item {
    id: powerButtonRoot
    property alias menu: powerMenu
    implicitWidth: height * 1.618

    Rectangle {
        id: powerButtonRect
        
        width: powerButtonRoot.width * 0.75
        height: powerButtonRoot.height * 0.75
        anchors.centerIn: parent

        color: Scheme.primary
        border.width: 1
        border.color: Scheme.outlineVariant
        radius: 4

        Image {
            id: iconImage
            source: "../../icons/power.svg"
            anchors.centerIn: powerButtonRect
            sourceSize.width: powerButtonRect.height * 0.8
            sourceSize.height: powerButtonRect.height * 0.8
        }

        ColorOverlay {
            anchors.fill: iconImage
            source: iconImage
            color: Scheme.textOnPrimary
        }

        MouseArea {
            anchors.fill: parent
            onClicked: powerButtonRoot.menu.visible = !powerButtonRoot.menu.visible
        }
    }

    PowerMenu {
        id: powerMenu
        anchors.top: powerButtonRoot.bottom
        anchors.left: powerButtonRoot.left
    }
}

