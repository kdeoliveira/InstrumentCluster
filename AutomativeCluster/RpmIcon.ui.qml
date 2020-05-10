import QtQuick 2.12
import AutomativeCluster 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import QtQuick.Extras 1.4

Item {
    id: element
    property bool active: false
    width: 50
    height: 50
    Image {
        id: rpmIcon
        width: 50
        height: 50
        source: "imports/iso-icons/icons8-speedometer-100.png"
        fillMode: Image.PreserveAspectFit
    }
    ColorOverlay {
        id: colorOverlay
        anchors.fill: rpmIcon
        source: rpmIcon
        color: "#1d1d1d"
    }
    states: [
        State {
            name: "on"
            when: element.active == true
            PropertyChanges {
                target: colorOverlay
                color: "#e6e73232"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#000000";height:50;width:50}
}
##^##*/
