import QtQuick 2.0
import "../tiles"

/*

    Purpose: Display extensive weather information

    ToDo:   -

*/

Item {
    // == Tiles == //
    width: parent.width; height: parent.height
    anchors.top: parent.top
    anchors.topMargin: 160 * scaleRatio

        // Lights Tile //
        Tile {
            anchors.right: middle.left
            anchors.rightMargin: 90 * scaleRatio

        }

        // Weather Tile //
        Tile {
            id: middle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        // Settings Tile //
        Tile {
            anchors.left: middle.right
            anchors.leftMargin: 90 * scaleRatio
        }
}
