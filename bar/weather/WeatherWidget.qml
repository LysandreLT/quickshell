import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets
import qs.utils

Rectangle {
    id: weatherBackgroundRect
    radius: 4
    color: Scheme.surface
    border.color: Scheme.outline
    border.width: 1
    implicitWidth: weatherLayout.implicitWidth + height * 0.25

    function fetchWeather() {
        var url = "https://api.open-meteo.com/v1/forecast?latitude=48.858232&longitude=2.294588&current_weather=true"
        var xhr = new XMLHttpRequest()
        xhr.open("GET", url)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText)
                    updateEmoji(response.current_weather.weathercode)
                    temperatureText.text = response.current_weather.temperature  + "°C"
                } else {
                    console.log("Erreur météo:", xhr.status)
                }
            }
        }
        xhr.send()
    }

    function updateEmoji(code) {
        switch(code) {
        case 0:
            weatherEmoji.text = Emoji.sunny
            break
        case 1:
        case 2:
            weatherEmoji.text = Emoji.partlyCloudy
            break
        case 3:
            weatherEmoji.text = Emoji.cloudy
            break
        case 45:
        case 48:
            weatherEmoji.text = Emoji.fog
            break
        case 51:
        case 53:
        case 55:
            weatherEmoji.text = Emoji.lightRain
            break
        case 61:
        case 63:
        case 65:
            weatherEmoji.text = Emoji.rain
            break
        case 71:
        case 73:
        case 75:
        case 77:
            weatherEmoji.text = Emoji.snow
            break
        case 80:
        case 81:
        case 82:
            weatherEmoji.text = Emoji.thunderstorm
            break
        case 95:
        case 96:
        case 99:
            weatherEmoji.text = Emoji.thunderstorm
            break
        default:
            weatherEmoji.text = "❓"
            break
        }
    }

    Component.onCompleted: {
        fetchWeather()
    }

    Timer {
        id: updateTimer
        interval: 15 * 60 * 1000
        running: true
        repeat: true
        onTriggered: fetchWeather()
    }

    RowLayout {
        id: weatherLayout
        anchors.centerIn: parent

        Text {
            id: weatherEmoji
            font.family: "Noto Sans Mono"
            font.pixelSize: weatherBackgroundRect.height * 0.7
            color: Scheme.textOnSurface
            fontSizeMode: Text.Fit
        }

        Text  {
            id: temperatureText
            font.family: "Noto Sans Mono"
            font.weight: 550
            font.pixelSize: weatherBackgroundRect.height * 0.4
            color: Scheme.textOnSurface
            fontSizeMode: Text.Fit
        }
    }
    
}
