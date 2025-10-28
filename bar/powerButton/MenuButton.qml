import QtQuick
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects
import qs.utils

WrapperMouseArea {
    id : menuButtonRoot
    required property url iconUrl

    implicitWidth: menuButtonRoot.height * 1.618
    implicitHeight: menuButtonRoot.height

    Rectangle {
        implicitWidth:  parent.width
        height: parent.height
        color: Scheme.surface

        Rectangle {
            color: Scheme.primaryContainer
            height: parent.height * 0.8
            width: parent.width * 0.8
            anchors.centerIn: parent
            radius: 4

            Image {
                id: iconImage
                source: iconUrl
                anchors.centerIn: parent
                sourceSize.width: menuButtonRoot.height * 0.8
                sourceSize.height: menuButtonRoot.height * 0.8
            }

            ColorOverlay {
                anchors.fill: iconImage
                source: iconImage
                color: Scheme.textOnPrimaryContainer
            }
        }
    }
}