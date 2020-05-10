import QtQuick 2.12
import AutomativeCluster 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtQuick.Studio.Effects 1.0
import QtGraphicalEffects 1.0

Item {
    id: tachimeterUI
    width: 1150
    height: 1154
    property alias oilTempIcon: oilTempIcon.active
    property alias displayRPM: element9.text
    property alias rpmIcon: rpmIcon.active
    property alias oilTimeline: oilTimeline.currentFrame
    property alias rpmTimeline: rpmTimeline.currentFrame

    Item {
        id: top_level
        x: 0
        y: 0
        width: 1150
        height: 1154

        Image {
            width: 1150
            height: 863
            smooth: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            source: "imports/cluster.psd/tachimeter_219_42_219_42.png"
        }

        Image {
            id: tach_ind
            x: 7
            y: 6
            width: 1136
            height: 812
            smooth: true
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            source: "imports/cluster.psd/tach_ind.png"
        }

        Item {
            id: oilUI
            x: 58
            y: 898
            width: 1038
            height: 256
            clip: false

            Image {
                id: fuelGauge
                x: 151
                y: 64
                width: 732
                smooth: false
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                source: "imports/cluster.psd/_path__219_45_219_45.png"
            }

            OilTempIcon {
                id: oilTempIcon
                x: 477
                y: 64
                width: 85
                height: 85
                active: false
            }

            ArcItem {
                id: arc1
                x: 0
                y: -46
                width: 1140
                height: 1144
                antialiasing: false
                fillColor: "#00000000"
                strokeColor: "#e6e73232"
                outlineArc: false
                radiusOuterAdjust: 0
                radiusInnerAdjust: 0
                round: false
                dashPattern: [0.5, 0.5, 0.5, 0.5]
                strokeStyle: 1
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                strokeWidth: 60
                begin: 218
                end: 219
            }

            Text {
                id: element10
                x: 183
                y: 83
                text: "C"
                font.family: "Dosis"
                font.pixelSize: 50
            }

            Text {
                id: element11
                x: 820
                y: 83
                text: "H"
                font.family: "Dosis"
                font.pixelSize: 50
            }

            EngineIcon {
                id: engineIcon
                x: 217
                y: -146
                width: 85
                height: 85
            }

            EngineOilIcon {
                id: engineOilIcon
                x: 742
                y: -146
                width: 85
                height: 85
                active: true
            }
        }

        Item {
            id: indicatorText
            x: 8
            y: -3
            width: 1134
            height: 959
            anchors.verticalCenterOffset: -100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: element
                x: 95
                y: 750
                color: "#ffffff"
                text: "OFF"
                font.weight: Font.ExtraLight
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Dosis"
                font.pixelSize: 43
            }

            Text {
                id: element1
                x: 50
                y: 515
                width: 39.075
                color: "#ffffff"
                text: "1"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element2
                x: 130
                y: 281
                color: "#ffffff"
                text: "2"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element3
                x: 326
                y: 106
                color: "#ffffff"
                text: "3"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element4
                x: 549
                y: 56
                color: "#ffffff"
                text: "4"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element5
                x: 780
                y: 113
                color: "#ffffff"
                text: "5"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element6
                x: 965
                y: 281
                color: "#ffffff"
                text: "6"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element7
                x: 1048
                y: 515
                color: "#ffffff"
                text: "7"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element8
                x: 1005
                y: 738
                color: "#ffffff"
                text: "8"
                verticalAlignment: Text.AlignVCenter
                font.family: "Dosis"
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.ExtraLight
                font.pixelSize: 63
            }

            Text {
                id: element12
                x: 50
                y: 616
                color: "#ffffff"
                text: "READY"
                horizontalAlignment: Text.AlignHCenter
                font.family: "Dosis"
                font.weight: Font.ExtraLight
                font.pixelSize: 43
                verticalAlignment: Text.AlignVCenter
            }

            RpmIcon {
                id: rpmIcon
                x: 986
                y: 622
                width: 50
                height: 50
                active: true
            }
        }

        Item {
            id: pivot
            x: 475
            y: 477
            width: 200
            height: 200
            rotation: -115
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: needle
                x: 13
                y: -461
                width: 36
                height: 561
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                source: "imports/cluster.psd/needle.png"
            }
            Glow {
                anchors.fill: needle
                radius: 15
                smooth: false
                spread: 0.2
                cached: true
                fast: true
                samples: 25
                color: "#860e0e"
                source: needle
            }
        }

        Image {
            id: center
            x: 275
            y: 277
            width: 600
            height: 600
            smooth: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "imports/cluster.psd/cener_circle_219_37_219_37.png"

            InnerShadow {
                id: innerShadow
                color: "#e6e73232"
                radius: 3
                opacity: 0
                cached: true
                fast: true
                horizontalOffset: 0
                samples: 8
                spread: 0.5
                verticalOffset: 2
                anchors.fill: center
                source: center
            }
        }

        Item {
            id: centerUI
            x: 275
            y: 277
            width: 600
            height: 600
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: element14
                x: 277
                y: 184
                color: "#1d1d1d"
                text: "RPM"
                font.weight: Font.Light
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenterOffset: 2
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
                font.family: "Dosis"
            }

            Text {
                id: element9
                x: 28
                y: 229
                width: 543
                height: 141
                color: "#ffffff"
                text: "1500"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.weight: Font.Light
                font.family: "Dosis"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 150
            }

            Text {
                id: element13
                x: 242
                y: 376
                color: "#1d1d1d"
                text: "x 1000"
                anchors.horizontalCenterOffset: 2
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Dosis"
                font.weight: Font.Light
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 50
            }
        }
    }

    Timeline {
        id: rpmTimeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: false
                to: 1000
                loops: 1
                duration: 1000
                from: 0
            }
        ]
        enabled: true
        endFrame: 8000
        startFrame: 0

        KeyframeGroup {
            target: pivot
            property: "rotation"
            Keyframe {
                frame: 0
                value: -115
            }

            Keyframe {
                frame: 998
                value: -86
            }

            Keyframe {
                frame: 8000
                value: 115
            }
        }

        KeyframeGroup {
            target: innerShadow
            property: "opacity"

            Keyframe {
                frame: 1250
                value: 1
            }

            Keyframe {
                value: 0
                frame: 500
            }
        }
    }

    Timeline {
        id: oilTimeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation1
                from: 0
                to: 1000
                loops: 1
                running: false
                duration: 1000
            }
        ]
        startFrame: 0
        enabled: true
        endFrame: 8000

        KeyframeGroup {
            target: arc1
            property: "strokeColor"

            Keyframe {
                value: "#e6ffffff"
                frame: 15
            }

            Keyframe {
                value: "#e6ffffff"
                frame: 63
            }

            Keyframe {
                value: "#e6e73232"
                frame: 68
            }

            Keyframe {
                frame: 10
                value: "#e60842c0"
            }

            Keyframe {
                frame: 0
                value: "#e60842c0"
            }
        }

        KeyframeGroup {
            target: arc1
            property: "begin"
            Keyframe {
                value: 218
                frame: 0
            }

            Keyframe {
                value: 141
                frame: 78
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:1154;width:1150}D{i:28;timeline_expanded:true}D{i:27;timeline_expanded:true}
D{i:33}
}
##^##*/

