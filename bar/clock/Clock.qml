import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.utils


Rectangle {
    id: clockBackgroundRect
    radius: 4
    color: Scheme.surface
    border.color: Scheme.outline
    border.width: 1
    implicitWidth: clockText.width + height * 0.25

    ColumnLayout {
        anchors.centerIn: parent
        spacing: -parent.height * 0.2

        Text {
            id: clockText
            text: Time.time
            font.family: "Noto Sans Mono"
            font.weight: 550
            font.pixelSize: clockBackgroundRect.height * 0.6
            color: Scheme.textOnSurface
            Layout.alignment: Qt.AlignHCenter
            fontSizeMode: Text.Fit
        }

        Text {
            id: dateText
            text: Time.date
            font.family: "Noto Sans Mono"
            font.weight: 550
            font.pixelSize: clockBackgroundRect.height * 0.3
            color: Scheme.textOnSurface
            Layout.alignment: Qt.AlignHCenter
            fontSizeMode: Text.Fit
        }
    }
    
}