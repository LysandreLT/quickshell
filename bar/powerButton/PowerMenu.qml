import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import qs.utils

Item {
    id: root
    implicitHeight: layout.implicitHeight
    implicitWidth: layout.implicitWidth
    required property int buttonHeight

    signal clicked()

    ColumnLayout {
        id: layout
        spacing: 0

        MenuButton {
            iconUrl: "../../icons/power.svg"
            height: buttonHeight
            onClicked: shutdownProcess.running = true
            Process {
                id: shutdownProcess
                running: false
                command: ["poweroff"]
            }
        }

        MenuButton {
            iconUrl: "../../icons/sleep.svg"
            height: buttonHeight
            onClicked: {
                root.clicked()                
                sleepProcess.running = true
            }
            Process {
                id: sleepProcess
                running: false
                command: ["systemctl", "suspend"]
            }
        }

        MenuButton {
            iconUrl: "../../icons/refresh.svg"
            height: buttonHeight
            onClicked: rebootProcess.running = true
            Process {
                id: rebootProcess
                running: false
                command: ["systemctl", "reboot"]
            }
        }

        MenuButton {
            iconUrl: "../../icons/lock.svg"
            height: buttonHeight
            onClicked: {
                root.clicked()
                lockProcess.running = true
            }
            Process {
                id: lockProcess
                running: false
                command: ["hyprlock"]
            }
        }
    }
}
