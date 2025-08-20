pragma Singleton

import  Quickshell
import QtQuick

Singleton {
    id: timeRoot
    readonly property string dateTime: Qt.formatDateTime(clock.date, "dd/MM HH:mm")
    readonly property string time: Qt.formatDateTime(clock.date, "HH:mm")
    readonly property string date: Qt.formatDateTime(clock.date, "dd/MM")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}