import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs.utils

Item {
    id: systemTrayRoot
    implicitWidth: systemTrayLayout.implicitWidth > 0 ? systemTrayLayout.implicitWidth + height * 0.25 : 0

    PopupWindow {
        id: contextMenuWindow
        visible: false
    }

    RowLayout {
        id: systemTrayLayout
        anchors.centerIn: parent
        spacing: systemTrayRoot.height * 0.125        

        Repeater {
            model: SystemTray.items

            delegate: Rectangle {
                id: trayItemRectangle
                property var trayItem: modelData

                Layout.preferredWidth: systemTrayRoot.height * 0.75
                Layout.preferredHeight: systemTrayRoot.height * 0.75
                radius: 4

                IconImage {
                    source: trayItem.icon
                    implicitSize: parent.height * 0.9
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                    onClicked: (mouse)=> {
                        switch (mouse.button) {
                            case Qt.RightButton:
                                if (trayItem.hasMenu) {
                                    var globalPos = mapToGlobal(mouse.x, mouse.y)
                                    trayItem.display(contextMenuWindow, globalPos.x, globalPos.y)
                                    break
                                }
                            case Qt.LeftButton:
                                if (!trayItem.onlyMenu) {
                                    trayItem.activate()
                                }
                                break
                            case Qt.MiddleButton:
                                if (!trayItem.onlyMenu) {
                                    trayItem.secondaryActivate()
                                }
                                break
                        }
                    }
                }
            }
        }
    }
}