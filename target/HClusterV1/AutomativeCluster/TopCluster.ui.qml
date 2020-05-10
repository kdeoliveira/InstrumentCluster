import QtQuick 2.12
import AutomativeCluster 1.0

Item {
    id: element1
    width: 953
    height: 90

    //    function getAlert() {
    //        print("Alert changing")
    //        var tempLeft = leftArrow
    //        var tempRight = rightArrow
    //        if (alertArrow == true) {
    //            rightArrow = true
    //            leftArrow = true
    //        } else {
    //            rightArrow = tempRight
    //            leftArrow = tempLeft
    //        }
    //    }
    property bool alertArrow: false
    property alias rightArrow: rightArrowIcon.active
    property alias leftArrow: leftArrowIcon1.active

    Text {
        id: element
        x: 416
        y: 30
        color: "#ffffff"
        text: "12:51 pm"
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Dosis"
        font.pixelSize: 25
    }

    ArrowIcon {
        id: rightArrowIcon
        x: 740
        y: 3
        width: 85
        height: 85
        active: false
    }

    ArrowIcon {
        id: leftArrowIcon1
        x: 129
        y: 3
        width: 85
        height: 85
        rotation: 180
        active: false
    }
}

/*##^##
Designer {
    D{i:0;height:90;width:954}
}
##^##*/

