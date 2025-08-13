import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import qs.utils

PanelWindow {
    id: root
    visible: false
    implicitHeight: layout.implicitHeight
    implicitWidth: layout.implicitWidth

    ColumnLayout {
        id: layout
        anchors.fill: parent
        spacing: 1

        MenuButton {
            text: "Shutdown"
            backgroundColor: Scheme.primaryContainer
            textColor: Scheme.textOnPrimaryContainer
            onClicked: shutdownProcess.running = true
            Process {
                id: shutdownProcess
                running: false
                command: ["poweroff"]
            }
        }

        MenuButton {
            text: "Sleep"
            backgroundColor: Scheme.primaryContainer
            textColor: Scheme.textOnPrimaryContainer
            onClicked: {
                root.visible = false
                sleepProcess.running = true
            }
            Process {
                id: sleepProcess
                running: false
                command: ["systemctl", "suspend"]
            }
        }

        MenuButton {
            text: "Reboot"
            backgroundColor: Scheme.primaryContainer
            textColor: Scheme.textOnPrimaryContainer
            onClicked: rebootProcess.running = true
            Process {
                id: rebootProcess
                running: false
                command: ["systemctl", "reboot"]
            }
        }

        MenuButton {
            text: "Lock"
            backgroundColor: Scheme.primaryContainer
            textColor: Scheme.textOnPrimaryContainer
            onClicked: {
                root.visible = false
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
