import Quickshell
import QtQuick
import QtQuick.Layouts
import "powerButton"
import "workspaceIndicator"
import "clock"
import "weather"

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
            uniformCellSizes: true

                PowerButton {
                    Layout.fillHeight: true
                }

                WorkspaceBar {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillHeight: true
                    screen: barRoot.screen
                }

                WeatherWidget {
                    Layout.alignment: Qt.AlignRight
                    Layout.fillHeight: true
                }

                Clock {
                    Layout.alignment:  Qt.AlignRight
                    Layout.fillHeight: true
                }
                
            }
        }
    }
}