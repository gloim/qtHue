import QtQuick 2.13
import QtQuick.Shapes 1.12


/*

    Purpose: ...

    ToDo:   -

*/

Tile {
    iconFilePath: '../images/sunIcon.png'

    Rectangle {
        width: parent.width; height: 335
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00FFFFFF" }
            GradientStop { position: 0.75; color: "#66FFFF00" }
            GradientStop { position: 1.0; color: "#66FFFF00" }
        }
    }

    Item {
        width: 40; height: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: weatherInformationContainer.top
        anchors.bottomMargin: 30

        Text {
            id: currentTemp
            text: qsTr("24°C") // currentTemp
            anchors.centerIn: parent
            anchors.margins: 0
        }
    }

    Item {
        property int minTemp: 12
        property int maxTemp: 21
        property int temperatureRange: maxTemp - minTemp

        id: weatherInformationContainer
        width: parent.width; height: 230
        anchors.bottom: parent.bottom

        Text {
            id: maxTempText
            text: "21"
            anchors.right: temperatureGraph.left
            anchors.top: temperatureGraph.top
            anchors.topMargin: 5
            font.pixelSize: 15
        }

        Text {
            id: minTempText
            text: "12"
            anchors.right: temperatureGraph.left
            anchors.bottom: temperatureGraph.bottom
            anchors.bottomMargin: 5
            font.pixelSize: 15
        }

        Shape {
            id: temperatureGraph
            width: 260
            height: 90
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            layer.enabled: true
            layer.samples: 8
            ShapePath {
                property int temperatureCanvasWidth: temperatureGraph.width - 10
                property int temperatureCanvasHeight: temperatureGraph.height - 10

                id: temperaturePath
                strokeColor: "black"
                strokeWidth: 7
                fillColor: "transparent"
                capStyle: ShapePath.SquareCap
                joinStyle: ShapePath.RoundJoin

                startX: 5; startY: temperatureCanvasHeight - (14 - weatherInformationContainer.minTemp) * (temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 0; y: 80 - (14 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 1; y: 80 - (13 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 2; y: 80 - (13 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 3; y: 80 - (13 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 4; y: 80 - (12 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 5; y: 80 - (12 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 6; y: 80 - (12 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 7; y: 80 - (12 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 8; y: 80 - (14 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 9; y: 80 - (17 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 10; y: 80 - (17 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 11; y: 80 - (18 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 12; y: 80 - (19 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 13; y: 80 - (19 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 14; y: 80 - (20 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 15; y: 80 - (21 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 16; y: 80 - (21 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 17; y: 80 - (21 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 18; y: 80 - (21 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 19; y: 80 - (20 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 20; y: 80 - (19 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 21; y: 80 - (18 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 22; y: 80 - (16 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 23; y: 80 - (15 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
                PathLine { x: 5 + temperaturePath.temperatureCanvasWidth / 24 * 24; y: 80 - (14 - weatherInformationContainer.minTemp) * (temperaturePath.temperatureCanvasHeight / weatherInformationContainer.temperatureRange) + 5 }
            }
        }

        Item {
            id: temperatureGraphTime
        }

        Item {
            id: weatherConditions
        }
    }

    Component.onCompleted: {
        var JsonString = '{
           "hourly":{
              "summary":"Partly cloudy throughout the day.",
              "icon":"clear-day",
              "data":[
                 {
                    "time":1565704800,
                    "summary":"Clear",
                    "icon":"clear-day",
                    "precipIntensity":0,
                    "precipProbability":0,
                    "temperature":61.21,
                    "apparentTemperature":61.21,
                    "dewPoint":50.09,
                    "humidity":0.67,
                    "pressure":1014.19,
                    "windSpeed":4,
                    "windGust":5.19,
                    "windBearing":197,
                    "cloudCover":0.1,
                    "uvIndex":0,
                    "visibility":7.652,
                    "ozone":301.5
                 },
                 {
                    "time":1565708400,
                    "summary":"Clear",
                    "icon":"clear-day",
                    "precipIntensity":0,
                    "precipProbability":0,
                    "temperature":62.65,
                    "apparentTemperature":62.65,
                    "dewPoint":50.92,
                    "humidity":0.65,
                    "pressure":1014.49,
                    "windSpeed":3.68,
                    "windGust":4.69,
                    "windBearing":216,
                    "cloudCover":0.09,
                    "uvIndex":1,
                    "visibility":9.161,
                    "ozone":300.6
                 },
                 {
                    "time":1565712000,
                    "summary":"Clear",
                    "icon":"clear-day",
                    "precipIntensity":0,
                    "precipProbability":0,
                    "temperature":64.09,
                    "apparentTemperature":64.09,
                    "dewPoint":54.18,
                    "humidity":0.7,
                    "pressure":1015.37,
                    "windSpeed":3.79,
                    "windGust":4.59,
                    "windBearing":202,
                    "cloudCover":0.06,
                    "uvIndex":2,
                    "visibility":10,
                    "ozone":299.9
                 },
                 {
                    "time":1565715600,
                    "summary":"Clear",
                    "icon":"clear-day",
                    "precipIntensity":0,
                    "precipProbability":0,
                    "temperature":66.31,
                    "apparentTemperature":66.31,
                    "dewPoint":56.53,
                    "humidity":0.71,
                    "pressure":1015.87,
                    "windSpeed":3.71,
                    "windGust":4.49,
                    "windBearing":209,
                    "cloudCover":0.04,
                    "uvIndex":4,
                    "visibility":10,
                    "ozone":299.1
                 }
              ]
           }
        }';

        var JsonObject= JSON.parse(JsonString);

        var aString = JsonObject.hourly.data[1].time;

        var date = new Date(aString*1000);

        var hours = date.getHours();

        console.log(hours);
    }
}
