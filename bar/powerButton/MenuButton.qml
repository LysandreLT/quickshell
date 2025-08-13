import QtQuick
import Quickshell.Widgets

WrapperMouseArea {
    id : menuButtonRoot
    required property string text
    property color backgroundColor
    property color textColor

    Rectangle {
        id: button
        implicitWidth: 200
        implicitHeight: implicitWidth / 1.618
        color: menuButtonRoot.backgroundColor
    
        Text {
            text: menuButtonRoot.text
            anchors.centerIn: parent
            color: menuButtonRoot.textColor
        }
    }
}