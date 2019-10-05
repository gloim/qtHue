function advancedPopAnimation() {

    // This variable is needed to access the, not anymore, current item after pop()
    var currentItem = stacky.currentItem;
    contentXAnimationEnabled = true;
        console.log("===== Advanced Pop Animation =====");

    // deducting 90 to remove the rightmost margin entirely as this margin stands "alone". The formla basically divides the scrollView content into pairs of margin and tile
    var result = (currentItem.flickableItem.contentX) / ((currentItem.contentItem.width - 90 * scaleRatio) / (currentItem.contentItem.children.length - 2)); // -2  to deduct marginFix objects
        console.log('width of one margin&tile pair: ' +  (currentItem.contentItem.width - 90 * scaleRatio) / (currentItem.contentItem.children.length - 2));
        console.log("result: " + result);
        console.log("contentX: " + currentItem.flickableItem.contentX);
        console.log("width: " + currentItem.contentItem.width);
        console.log("children.length: " + currentItem.contentItem.children.length);

    // eliminating everything before the period
    var resultDecimals = result - Math.floor(result);
        console.log("resultDecimals: " + resultDecimals);

    //set duration of contentXAnimation
    animationDuration = 1 / (window.width / 1200) * (resultDecimals * 510);
        console.log(animationDuration);

    // setting new contentX
    currentItem.flickableItem.contentX = currentItem.flickableItem.contentX - (600 * scaleRatio * resultDecimals);

    // resolves an issue where you can see the clipped shadow of the item left of the leftmost visible item - this was an issue during the push and pop animations
    if (result > 1) {
        currentItem.contentItem.children[~~result - 1].children[1].color = primaryColor;
    }

    delay(animationDuration, function() { stacky.pop(); } )

    delay2(1200, function() {
                        if(result >= 1) {
                            currentItem.contentItem.children[~~result - 1].children[1].color = shadowColor;
                        }
                  })

    contentXAnimationEnabled = false;
}

function applyMarginFix() {
    for (var i = 0; i < tileContainer.children.length ; i++) {
        if (i < i - 1) {
            firstItem = i;
        }

        if (i !== 0 && i > i - 1) {
            lastItem = i;
        }
    }

    var marginFixLeftObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle { id: marginFixLeft; anchors.left: parent.left; }', tileContainer);

    var marginFixRightObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle { id: marginFixRight; anchors.leftMargin: 90 * scaleRatio; }', tileContainer);


    tileContainer.children[firstItem].anchors.left = marginFixLeftObject.right;
    marginFixRightObject.anchors.left = tileContainer.children[lastItem].right;
}

