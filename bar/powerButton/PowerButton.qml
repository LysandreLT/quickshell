import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.utils

Item {
    id: powerButtonRoot
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
            onClicked: {
                powerMenuWindow.visible = !powerMenuWindow.visible
                powerMenuWindowFocusGrab.active = true
            }
        }

        PopupWindow {
            id: powerMenuWindow
            anchor.item: powerButtonRoot
            anchor.gravity: Edges.Bottom
            anchor.edges: Edges.Bottom
            implicitHeight: powerMenu.implicitHeight
            implicitWidth: powerMenu.implicitWidth
            color: "transparent"
            visible: false

            PowerMenu {
                id: powerMenu
                onClicked: powerMenuWindow.visible = false
                buttonHeight: powerButtonRoot.height
            }

            HyprlandFocusGrab {
                id: powerMenuWindowFocusGrab
                windows: [ powerMenuWindow ]
                onCleared: powerMenuWindow.visible = false
            }
        }
    }
}

