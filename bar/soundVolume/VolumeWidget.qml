import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import Quickshell.Hyprland
import qs.utils

Item {
    id: volumeButtonRoot
    implicitWidth: volumeIconImage.width

    PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	Connections {
		target: Pipewire.defaultAudioSink?.audio ?? 0

		function onVolumeChanged() {
			volumeSlider.value = Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
		}
	}

    Component.onCompleted: {
        volumeSlider.value = Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
    }

    Image {
        id: volumeIconImage
        anchors.centerIn: parent
        source: volumeSlider.value == 0 ? "../../icons/volume_off.svg" : "../../icons/volume_up.svg"
        sourceSize.width: volumeButtonRoot.height * 0.6
        sourceSize.height: volumeButtonRoot.height * 0.6
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            volumeSliderWindow.visible = !volumeSliderWindow.visible
            volumeSliderWindowFocusGrab.active = true
        }
    }

    PopupWindow {
        id: volumeSliderWindow
        anchor.item: volumeButtonRoot
        anchor.gravity: Edges.Bottom
        anchor.edges: Edges.Bottom
        implicitWidth: volumeButtonRoot.height * 3
        implicitHeight: volumeButtonRoot.height
        color: "transparent"
        visible: false

        Rectangle {
            id: volumeSliderBackgroundRect

            anchors.fill: parent
            color: Scheme.surface
            border.color: Scheme.outline
            border.width: 1
            radius: 4
            
            Slider {
                id: volumeSlider
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.1
                anchors.rightMargin: parent.width * 0.1
                implicitWidth: parent.width * 0.6
                visible: true
                to: 100
                snapMode: Slider.SnapAlways
                stepSize: 1
                onMoved: Pipewire.defaultAudioSink.audio.volume = volumeSlider.value / 100

                background: 
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        width: volumeSlider.availableWidth
                        height: volumeSliderBackgroundRect.height / 4.44
                        radius: height / 2
                        color: Scheme.secondaryContainer

                        Rectangle {
                            width: volumeSlider.visualPosition * parent.width
                            height: parent.height
                            color: Scheme.primary
                            topLeftRadius: parent.radius
                            bottomLeftRadius: parent.radius
                        }
                    }

                handle: 
                    Rectangle {
                        x: volumeSlider.visualPosition * volumeSlider.width
                        implicitWidth: volumeSliderBackgroundRect.height / 8.88
                        implicitHeight: volumeSliderBackgroundRect.height * 0.6
                        radius: width / 2
                        color: Scheme.primary
                    }
            }

            Text {
                text: Math.round(volumeSlider.value)
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.1
                font.pixelSize: volumeSliderBackgroundRect.height / 4.44
                font.family: "Noto Sans Mono"
                font.weight: 550
                color: Scheme.textOnSurface
            }
        }

        HyprlandFocusGrab {
            id: volumeSliderWindowFocusGrab
            windows: [ volumeSliderWindow ]
            onCleared: volumeSliderWindow.visible = false
        }
    }
}
