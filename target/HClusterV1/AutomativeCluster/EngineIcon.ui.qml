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
    IsoItem {
        id: engineIcon
        x: 0
        y: 0
        width: 85
        height: 85
        color: "#1d1d1d"
        source: "imports/iso-icons/iso_grs_7000_4_0640.dat"
    }

    states: [
        State {
            name: "on"
            when: element.active == true

            PropertyChanges {
                target: engineIcon
                color: "#e6e73232"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;height:85;width:85}
}
##^##*/

