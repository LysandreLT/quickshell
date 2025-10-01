import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects
import Quickshell.Widgets

Item {
    id: gaugeRoot
    required property int value
    required property color primaryColor
    required property color primaryContainerColor
    required property color textOnPrimaryContainerColor
    required property url iconUrl
    property real centerX: width / 2
    property real centerY: height / 2.5
    property real radiusX: width / 2.2
    property real radiusY: height / 2.3

    Shape {
        anchors.fill: parent
        ShapePath {
            strokeWidth: height / 10
            strokeColor: gaugeRoot.primaryContainerColor
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            PathAngleArc {
                centerX: gaugeRoot.centerX
                centerY: gaugeRoot.centerY
                radiusX: gaugeRoot.radiusX
                radiusY: gaugeRoot.radiusY
                startAngle: 180
                sweepAngle: 180
            }
        }
    }

    Shape {
        anchors.fill: parent
        ShapePath {
            strokeWidth: height / 10
            strokeColor: gaugeRoot.primaryColor
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            PathAngleArc {
                centerX: gaugeRoot.centerX
                centerY: gaugeRoot.centerY
                radiusX: gaugeRoot.radiusX
                radiusY: gaugeRoot.radiusY
                startAngle: 180
                sweepAngle: value / 100 * 180
            }
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -gaugeRoot.height * 0.2
        text: gaugeRoot.value + "%"
        font.family: "Noto Sans Mono"
        font.weight: 550
        font.pixelSize: gaugeRoot.height * 0.3
        color: gaugeRoot.textOnPrimaryContainerColor
        fontSizeMode: Text.Fit
    }

    Image {
        id: iconImage
        source: iconUrl
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: gaugeRoot.height * 0.3
        sourceSize.width: gaugeRoot.height * 0.6
        sourceSize.height: gaugeRoot.height * 0.6
    }

    ColorOverlay {
        anchors.fill: iconImage
        source: iconImage
        color: gaugeRoot.primaryColor
    }
}
