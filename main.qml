import QtQuick 2.13
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Window 2.13
import "./tiles"
import "./customComponents"
import "./pages"
import "./js/uiFunctions.js" as UiFunctions
/*

    Purpose: main.qml file of qtHue

    ToDo:   - check if configured on startup
                - true -> ...
                - false -> ...
            - center pages horizontally. Old Method interfered with the pop and push enter animations
            - solve cut of scrollView items during scrollView animation
            - connect animation easing of the contentX and popExit animation during popExit
            - need to add variables for reoccurring values
            - change drop shadow color back after re-entry

*/
/* some ideas for the future:   - proximity/movement sensor module so the display turns when the hand of the user comes near
                                - music player
                                - "lock screen", display clock etc. -> basically a lock screen but without the locking
                                - displaying electricity bills etc. -> basically listing the households perpetual expenses

*/

ApplicationWindow {

    // Scaling //
    property double scaleRatio: window.height /  1080

    // Colors //
    property string primaryColor: "#fff"
    property string secondaryColor: "#000"
    property string tertiaryColor: "#B1B1B1"
    property string shadowColor: "#1A000000"

    // Misc //
    property bool contentXAnimationEnabled: false
    property double animationDuration
    property int startingY
    property int endingY



    id: window
    visible: true
//    visibility: "FullScreen"
//    width: 1920
//    height: 1080
    width: 1024
    height: 768
    color: primaryColor
    title: qsTr("qtHue")

    LightsPage {
        id: lightsPage
    }

    HomePage {
        id: homePage
    }

    StackView {
        id: stacky
        anchors.fill: parent
        initialItem: homePage


        pushEnter: Transition {
            NumberAnimation {
                property: stacky.currentItem !== homePage ? "y" : "x"
                from: stacky.currentItem !== homePage ? window.height : window.width
                duration: 1200
                easing.type: Easing.InOutQuad
            }
        }
        pushExit: Transition {
            NumberAnimation {
                property: stacky.currentItem !== homePage ? "x" : "y"
                to: stacky.currentItem !== homePage ? window.width :  window.height
                duration: 1200
                easing.type: Easing.InOutQuad
            }
        }
        popEnter: Transition {
            NumberAnimation {
                property: stacky.currentItem !== homePage ? "y" : "x"
                from: stacky.currentItem !== homePage ? window.height : window.width
                duration: 1200
                easing.type: Easing.InOutQuad
            }
        }
        popExit: Transition {
            NumberAnimation {
                property: stacky.currentItem !== homePage ? "x" : "y"
                to: stacky.currentItem !== homePage ? window.width :  window.height
                duration: 1200 - animationDuration
                easing.type: animationDuration === 0 ? Easing.InOutQuad : Easing.OutQuad
            }
        }
    }

//    WeatherPage {
//        id: weatherPage
//    }

//    SettingsPage {
//        id: settingsPage
//    }

    Rectangle {
        id: homeGestureField
        width: window.width; height: 80 * scaleRatio
        anchors.bottom: parent.bottom
        gradient: Gradient {
                GradientStop { position: 0.33; color: primaryColor }
                GradientStop { position: 1.0; color: secondaryColor }
        }
        opacity: 0 //.5

        MultiPointTouchArea {
            anchors.fill: parent
            touchPoints: [
                TouchPoint {
                    id: point1
                    onPressedChanged: {
                        if(pressed) {
                            startingY = point1.y
                            console.log("===== Home/pop() Gesture =====")
                            console.log("start: " + startingY)
                        }
                        if (!pressed) {
                            endingY = point1.y
                            console.log("end: " + endingY)

                            // checks if y-axis position is -300 less on release than on press
                            if (endingY < startingY - 300 * scaleRatio && stacky.currentItem !== homePage) {
                                console.log('Gesture event activated')
                                UiFunctions.advancedPopAnimation()
                            }else {
                                console.log('Gesture event NOT activated')
                            }
                        }
                    }
                }
            ]
        }
    }


    // There are two delay functions and Timers here so two delay functions can be used simultaneously - The limitation forcing this is the Timer object

    Timer {
        id: timer
    }

    Timer {
        id: timer2
    }

    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

    function delay2(delayTime, cb) {
        timer2.interval = delayTime;
        timer2.repeat = false;
        timer2.triggered.connect(cb);
        timer2.start();
    }
}
