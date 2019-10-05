import QtQuick 2.13
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.13
import QtQuick.Window 2.13
import "../customComponents"

/*

    Purpose: Major UI element - Almost every element is displayed within in a Tile

    ToDo:   -

*/

Button {
    property string iconFilePath: '../images/bulbIcon.png'

    width: 510 * scaleRatio; height: 800 * scaleRatio

    // Tile //
    Rectangle {
        // Tile Background //
        id: tile
        width: parent.width; height: parent.height
        color: primaryColor

        // Tile Icon //
        Image {
            id: tileIcon
            source: iconFilePath
            width: 250 * scaleRatio
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 60  * scaleRatio
        }

        // Divider //
        Divider {
            id: tileDivider
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: tileIcon.bottom
            anchors.topMargin: 60  * scaleRatio
        }
    }

    // Drop Shadow of Tile //
    DropShadow {
        source: tile
        anchors.fill: tile
        horizontalOffset: 4  * scaleRatio
        verticalOffset: 2  * scaleRatio
        radius: 18  * scaleRatio
        samples: radius
        color: shadowColor
    }
}
