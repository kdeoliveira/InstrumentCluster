import QtQuick 2.12
import AutomativeCluster 1.0

Item {
    id: element
    width: Constants.width
    height: Constants.height
    smooth: false

    Rectangle{
        id: rectangle
        color: "#000000"
        smooth: false
        anchors.fill: parent
        Screen01 {
            color: "#000000"
            enabled: true
            smooth: false
            scale: 0.5
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.6600000262260437}
}
##^##*/
