import QtQuick 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import "../tiles"
import "../customComponents"

/*

    Purpose: Home Page of qtHue

    ToDo:   - add Status Bar
            - add Lights, Weather and Settings Tile

*/


CustomScrollView {
    // Lights Tile //
    Tile {
        id: first
        anchors.leftMargin: 90 * scaleRatio
        onClicked: stacky.push(lightsPage)
     }

    // Weather Tile //
    Tile {
        id: second
        anchors.left: first.right
        anchors.leftMargin: 90 * scaleRatio
        onClicked: stacky.push(weatherPage)
        iconFilePath: '../images/sunIcon.png'
    }

    // Settings Tile //
    Tile {
        id: third
        anchors.left: second.right
        anchors.leftMargin: 90 * scaleRatio
        onClicked: stacky.push(settingsPage)
        iconFilePath: '../images/settingsIcon.png'
    }
}


