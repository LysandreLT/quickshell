import Quickshell
import QtQuick
import QtQuick.Layouts
import "powerButton"
import "workspaceIndicator"
import "clock"
import "weather"
import "systemTray"
import "systemInfo"

Item{
    id: bar

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: barRoot
            required property var modelData
            screen: modelData

            anchors {
                left: true
                top: true
                right: true
            }

            color: "transparent"
            implicitHeight: 40

            RowLayout {
                id: barLayout
                anchors.fill: parent
                spacing: 0

                PowerButton {
                    Layout.fillHeight: true
                }

                SystemInfo {
                    Layout.fillHeight: true
                }

                Item {
                    Layout.fillWidth: true
                }

                WorkspaceBar {
                    Layout.fillHeight: true
                    screen: barRoot.screen
                }

                Item {
                    Layout.fillWidth: true
                }

                WeatherWidget {
                    Layout.fillHeight: true
                }

                SystemTray {
                    Layout.fillHeight: true
                }

                Clock {
                    Layout.fillHeight: true
                }
                
            }
        }
    }
}