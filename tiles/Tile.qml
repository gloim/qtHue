import QtQuick 2.13
import QtGraphicalEffects 1.13
import QtQuick.Window 2.13

/*

    Purpose: Major UI element - Almost every element is displayed within in a Tile

    ToDo:   -

*/

Item {
    property string iconFilePath: '../images/bulbIcon.png'

    width: calculateSize(510); height: calculateSize(800)

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
            width: calculateSize(250);
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: calculateSize(60)
        }

        // Divider //
        Divider {
            id: tileDivider
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: tileIcon.bottom
            anchors.topMargin: calculateSize(60)
        }
    }

    // Drop Shadow of Tile //
    DropShadow {
        source: tile
        anchors.fill: tile
        horizontalOffset: calculateSize(4)
        verticalOffset: calculateSize(2)
        radius: calculateSize(18)
        samples: radius
        color: shadowColor
    }
}
