import QtQuick 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import "../tiles"
import "../js/uiFunctions.js" as UiFunctions


/*

    Purpose:

    ToDo:   - function saduiajsdfbhsdifhj - wtf did I try to say, all I know is I was in a hurry
            - shadow at borders on x axis when the leftmost item isn't the first object in the scrollview
            - disable scrollbar during animation
            - factor aspect ratio into animationDuration

*/


ScrollView {
    property int firstItem
    property int lastItem

    default property alias _contentChildren: tileContainer.data

    id: scrolll
    width: tileContainer.width < window.width ? tileContainer.width : parent.width; height: window.height
    //anchors.horizontalCenter: parent.horizontalCenter
    flickableItem.interactive: true
    flickableItem.boundsBehavior: "DragAndOvershootBounds"
    flickableItem.flickableDirection: "HorizontalFlick"


    style: ScrollViewStyle {
        handle: Rectangle {
            implicitHeight: 8.5 * scaleRatio
            color: tertiaryColor
        }

        scrollBarBackground: Rectangle {
            implicitWidth: window.width
            implicitHeight: 8.5 * scaleRatio
            color: primaryColor
        }
        transientScrollBars: true
    }

    Behavior on flickableItem.contentX {
        enabled: contentXAnimationEnabled
        NumberAnimation {
            id: contentXAnimation
            properties: "contentX"
            duration: animationDuration
            easing.type: Easing.InQuad
        }
    }

    Item {
        id: tileContainer
        implicitWidth: childrenRect.width; implicitHeight: childrenRect.height
        anchors.top: parent.top
        anchors.topMargin: 160 * scaleRatio

        // Adds marginFix objects so the left and right-most margins are included within childrenRect //
        // weirldy, all "border" margins are normally ignored by childrenRect //
        Component.onCompleted: {
            UiFunctions.applyMarginFix();
        }
    }
}
