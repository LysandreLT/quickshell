import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.utils


Item {
    id: clockRoot
    implicitWidth: clockText.width + height * 0.25

    ColumnLayout {
        anchors.centerIn: parent
        spacing: -parent.height * 0.2

        Text {
            id: clockText
            text: Time.time
            font.family: "Noto Sans Mono"
            font.weight: 550
            font.pixelSize: clockRoot.height * 0.6
            color: Scheme.textOnSurface
            Layout.alignment: Qt.AlignHCenter
            fontSizeMode: Text.Fit
        }

        Text {
            id: dateText
            text: Time.date
            font.family: "Noto Sans Mono"
            font.weight: 550
            font.pixelSize: clockRoot.height * 0.3
            color: Scheme.textOnSurface
            Layout.alignment: Qt.AlignHCenter
            fontSizeMode: Text.Fit
        }
    }
    
}