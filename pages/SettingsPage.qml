import QtQuick 2.0
import "../tiles"
import "../customComponents"

/*

    Purpose: Settings

    ToDo:   -

*/
CustomScrollView {

    // Lights Tile //
    Tile {
        id: first
        anchors.leftMargin: 90 * scaleRatio
        Text {
            text: qsTr("settings")
        }
     }

    // Weather Tile //
    Tile {
        id: second
        anchors.left: first.right
        anchors.leftMargin: 90 * scaleRatio
    }

    // Settings Tile //
    Tile {
        id: third
        anchors.left: second.right
        anchors.leftMargin: 90 * scaleRatio
    }
}
