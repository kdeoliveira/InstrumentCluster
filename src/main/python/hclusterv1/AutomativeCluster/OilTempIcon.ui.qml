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
    Image {
        id: oilIcon
        width: 85
        height: 85
        source: "imports/iso-icons/icons8-engine-coolant-100.png"
        fillMode: Image.PreserveAspectFit
    }
    ColorOverlay {
        id: colorOverlay
        anchors.fill: oilIcon
        source: oilIcon
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
    D{i:0;autoSize:true;height:0;width:0}
}
##^##*/

