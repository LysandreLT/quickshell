import Quickshell
import QtQuick
import QtQuick.Layouts
import "powerButton"
import "workspaceIndicator"
import "clock"
import "weather"

Item{
    id: bar

    PanelWindow {
        id: barRoot

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