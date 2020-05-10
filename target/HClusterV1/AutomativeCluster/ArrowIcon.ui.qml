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
        id: batteryIcon
        width: 85
        height: 85
        source: "imports/iso-icons/icons8-arrow-100.png"
        fillMode: Image.PreserveAspectFit
    }
    ColorOverlay {
        id: colorOverlay
        anchors.fill: batteryIcon
        source: batteryIcon
        color: "#1d1d1d"
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                pingPong: true
                duration: 300
                loops: -1
                to: 300
                running: false
                from: 0
            }
        ]
        endFrame: 100
        enabled: false
        startFrame: 0

        KeyframeGroup {
            target: colorOverlay
            property: "color"

            Keyframe {
                value: "#1d1d1d"
                frame: 0
            }
            Keyframe {
                value: "#1d1d1d"
                frame: 55
            }
            Keyframe {
                value: "#04dd13"
                frame: 65
            }
            Keyframe {
                value: "#04dd13"
                frame: 100
            }
        }
    }
    states: [
        State {
            name: "on"
            when: element.active == true

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }

            PropertyChanges {
                target: colorOverlay
                cached: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;height:85;width:85}D{i:2;timeline_expanded:true}
}
##^##*/

