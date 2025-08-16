import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Hyprland
import Quickshell
import Quickshell.Widgets
import qs.utils

Rectangle {
    id: backgroundRect
    radius: 4
    color: Scheme.surfaceContainer
    border.color: Scheme.outline
    border.width: 1

    implicitWidth: rowLayout.implicitWidth + height * 0.25


    RowLayout {
        id: rowLayout
        spacing: backgroundRect.height * 0.125
        anchors.centerIn: parent

        Repeater {
            model: Hyprland.workspaces
            delegate: Rectangle {
                id: wsRect
                property var workspaceItem: modelData
                property bool hovered: false
                property color hoverColor: Scheme.primaryContainer

                Layout.preferredWidth: backgroundRect.height * 0.75
                Layout.preferredHeight: backgroundRect.height * 0.75
                radius: 4
                
                border.width: 1
                border.color: Scheme.outline

                color: workspaceItem.id === Hyprland.focusedWorkspace.id
                        ? Scheme.primary
                        : (hovered ? hoverColor : Scheme.surface)

                Behavior on color {
                    ColorAnimation { duration: 150; easing.type: Easing.OutCubic }
                }

                IconImage {
                    source: Quickshell.iconPath(DesktopEntries.heuristicLookup(workspaceItem.toplevels.values[0].wayland.appId).icon)
                    implicitSize: parent.height * 0.9
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: hovered = true
                    onExited: hovered = false
                    onClicked: workspaceItem.id != Hyprland.focusedWorkspace.id && workspaceItem.activate()
                }
            }
        }
    }
}



