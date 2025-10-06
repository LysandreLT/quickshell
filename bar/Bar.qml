import Quickshell
import QtQuick
import QtQuick.Layouts
import "powerButton"
import "workspaceIndicator"
import "clock"
import "weather"
import "systemTray"
import "systemInfo"
import "soundVolume"
import qs.utils

Item{
    id: bar

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: barRoot
            required property var modelData
            screen: modelData

            anchors {
                left: true
                top: true
                right: true
            }

            color: "transparent"
            implicitHeight: 40

            RowLayout {
                id: barLayout
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.fillHeight: true
                    implicitWidth: leftLayout.implicitWidth
                    
                    color: Scheme.surface
                    border.color: Scheme.outline
                    border.width: 1
                    radius: 4

                    RowLayout {
                        id: leftLayout
                        anchors.fill: parent
                        spacing: 0
                        
                        PowerButton { Layout.fillHeight: true }
                        SystemInfo { Layout.fillHeight: true }
                        VolumeWidget { Layout.fillHeight: true }
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Rectangle {
                    Layout.fillHeight: true
                    implicitWidth: middleLayout.implicitWidth
                    
                    color: Scheme.surface
                    border.color: Scheme.outline
                    border.width: 1
                    radius: 4
                    
                    RowLayout {
                        id: middleLayout
                        anchors.fill: parent
                        spacing: 0
                        
                        WorkspaceBar { Layout.fillHeight: true; screen: barRoot.screen }
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Rectangle {
                    Layout.fillHeight: true
                    implicitWidth: rightLayout.implicitWidth
                    
                    color: Scheme.surface
                    border.color: Scheme.outline
                    border.width: 1
                    radius: 4
                    
                    RowLayout {
                        id: rightLayout
                        anchors.fill: parent
                        spacing: 0
                        
                        WeatherWidget { Layout.fillHeight: true }
                        SystemTray { Layout.fillHeight: true }
                        Clock { Layout.fillHeight: true }
                    }
                }
            }
        }
    }
}