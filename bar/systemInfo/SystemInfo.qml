import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils

Rectangle {
    id: systemInfoBackgroundRect
    color: Scheme.surface
    border.color: Scheme.outline
    border.width: 1
    radius: 4
    implicitWidth: systemInfoLayout.width + height * 0.25

    RowLayout {
        id: systemInfoLayout
        anchors.centerIn: parent
        spacing: 8

        CircularGauge {
            id: cpuGauge
            Layout.preferredWidth: systemInfoBackgroundRect.height * 0.75
            Layout.preferredHeight: systemInfoBackgroundRect.height * 0.75
            value: 0
            primaryColor: Scheme.primary
            primaryContainerColor: Scheme.primaryContainer
            textOnPrimaryContainerColor: Scheme.textOnPrimaryContainer
            iconUrl: "/../../icons/cpu.svg"
        }

        CircularGauge {
            id: gpuGauge
            Layout.preferredWidth: systemInfoBackgroundRect.height * 0.75
            Layout.preferredHeight: systemInfoBackgroundRect.height * 0.75
            value: 0
            primaryColor: Scheme.secondary
            primaryContainerColor: Scheme.secondaryContainer
            textOnPrimaryContainerColor: Scheme.textOnSecondaryContainer
            iconUrl: "/../../icons/gpu.svg"
        }

        CircularGauge {
            id: diskGauge
            Layout.preferredWidth: systemInfoBackgroundRect.height * 0.75
            Layout.preferredHeight: systemInfoBackgroundRect.height * 0.75
            value: 0
            primaryColor: Scheme.tertiary
            primaryContainerColor: Scheme.tertiaryContainer
            textOnPrimaryContainerColor: Scheme.textOnTertiaryContainer
            iconUrl: "/../../icons/disk.svg"
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            cpuProcess.running = true
            gpuProcess.running = true
            diskProcess.running = true
        }
    }

    Process {
        id: cpuProcess
        running: true
        command: ["sh", "-c", "
            read cpu user nice system idle iowait irq softirq steal guest < /proc/stat;
            total=$((user+nice+system+idle+iowait+irq+softirq+steal));
            busy=$((total - idle - iowait));
            echo $((busy * 100 / total))
        "]
        stdout: StdioCollector { onStreamFinished: cpuGauge.value = text }
    }

    Process {
        id: gpuProcess
        command: ["sh", "-c", "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits"]
        stdout: StdioCollector { onStreamFinished: gpuGauge.value = text }
    }

    Process {
        id: diskProcess
        command: ["sh", "-c", "df --output=pcent / | tail -1 | tr -dc '0-9'"]
        stdout: StdioCollector { onStreamFinished: diskGauge.value = text }
    }
}