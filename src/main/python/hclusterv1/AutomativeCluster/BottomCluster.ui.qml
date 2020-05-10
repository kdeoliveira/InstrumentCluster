import QtQuick 2.12
import AutomativeCluster 1.0

Item {
    id: element
    width: 478
    height: 100

    Text {
        id: element1
        x: 8
        y: 29
        width: 102
        height: 63
        color: "#ffffff"
        text: "Odomoter     125672 km"
        wrapMode: Text.WordWrap
        font.family: "Dosis"
        font.pixelSize: 25
    }

    Text {
        id: element2
        x: 336
        y: 29
        width: 124
        height: 63
        color: "#ffffff"
        text: "Trip                     253.9 km"
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        textFormat: Text.PlainText
        font.pixelSize: 25
        font.family: "Dosis"
    }

    Text {
        id: element3
        x: 202
        y: 40
        color: "#ffffff"
        text: "21 °C"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
        font.family: "Dosis"
    }
}

/*##^##
Designer {
    D{i:0;height:100;width:478}
}
##^##*/

