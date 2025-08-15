import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Hyprland
import qs.utils

Rectangle {
    id: backgroundRect
    radius: 4
    color: Scheme.surfaceContainer
    border.color: Scheme.outline
    border.width: 1

    implicitWidth: rowLayout.implicitWidth + 24


    RowLayout {
        id: rowLayout
        spacing: 8
        anchors.centerIn: parent

        Repeater {
            model: Hyprland.workspaces
            delegate: Rectangle {
                id: wsRect
                property var workspaceItem: modelData
                property bool hovered: false

                Layout.preferredWidth: backgroundRect.height * 0.75
                Layout.preferredHeight: backgroundRect.height * 0.75
                radius: 4
                border.width: 1
                border.color: Scheme.outline

                property color hoverColor: Scheme.primaryContainer
                color: workspaceItem.id === Hyprland.focusedWorkspace.id
                        ? Scheme.primary
                        : (hovered ? hoverColor : Scheme.surface)

                Behavior on color {
                    ColorAnimation { duration: 150; easing.type: Easing.OutCubic }
                }

                Text {
                    anchors.centerIn: parent
                    text: workspaceItem.id
                    color: workspaceItem.id === Hyprland.focusedWorkspace.id
                            ? Scheme.textOnPrimary
                            : Scheme.textOnSurface
                    font.pixelSize: 12
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: hovered = true
                    onExited: hovered = false
                    onClicked: workspaceItem.activate()
                }
            }
        }
    }
}



