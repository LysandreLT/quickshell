import Quickshell
import QtQuick
import QtQuick.Layouts
import "powerButton"

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
        implicitHeight: 30

        RowLayout {
            id: barLayout
            anchors.fill: parent

            PowerButton {}
            
            SystemClock {
                id: clock
                precision: SystemClock.Seconds
            }
            
            Text {
                Layout.alignment: Qt.AlignRight
                text: Qt.formatDateTime(clock.date, "hh:mm:ss - yyyy-MM-dd")
                color: "blue"
            }
        }
    }
}