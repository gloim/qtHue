import QtQuick 2.0
import "../tiles"
import "../customComponents"

/*

    Purpose: Control Center for all Lights

    ToDo:   -

*/

CustomScrollView {

    // Lights Tile //
    Tile {
        id: first
        anchors.leftMargin: 90 * scaleRatio
        Text {
            text: qsTr("lights")
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

    Tile {
        id: fourth
        anchors.left: third.right
        anchors.leftMargin: 90 * scaleRatio
    }

    Tile {
        id: fith
        anchors.left: fourth.right
        anchors.leftMargin: 90 * scaleRatio
    }

    Tile {
        id: sixth
        anchors.left: fith.right
        anchors.leftMargin: 90 * scaleRatio
    }

    Tile {
        id: seventh
        anchors.left: sixth.right
        anchors.leftMargin: 90 * scaleRatio
    }
}



