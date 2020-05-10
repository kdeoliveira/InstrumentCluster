import QtQuick 2.12
import AutomativeCluster 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Item {
    id: speedometerUI
    width: 1150
    height: 1154
    property alias absIcon: absIcon.active
    property alias fuelPercentage: element16.text
    property alias displaySpeed: element11.text
    property alias fuelIcon: fuelIcon.active
    property alias parkingIcon: parkingIcon.active
    property alias batteryIcon: batteryIcon.active
    property alias fuelTimeline: fuelTimeline.currentFrame
    property alias speedTimeline: speedTimeline.currentFrame

    Image {
        id: bg_ind
        width: 1150
        height: 863
        smooth: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        source: "imports/cluster.psd/tachimeter_219_42_219_42.png"
    }

    Image {
        id: speed_ind
        x: 0
        y: 6
        width: 1136
        height: 812
        smooth: true
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        source: "imports/cluster.psd/speed_ind.png"
    }

    Item {
        id: element
        x: 8
        y: 8
        width: 1134
        height: 866

        Text {
            id: element1
            x: 102
            y: 734
            color: "#ffffff"
            text: "0"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element2
            x: 62
            y: 521
            color: "#ffffff"
            text: "30"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element3
            x: 102
            y: 322
            color: "#ffffff"
            text: "60"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element4
            x: 244
            y: 157
            color: "#ffffff"
            text: "90"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element5
            x: 397
            y: 61
            color: "#ffffff"
            text: "120"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element6
            x: 633
            y: 61
            color: "#ffffff"
            text: "150"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element7
            x: 832
            y: 157
            color: "#ffffff"
            text: "180"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element8
            x: 961
            y: 322
            color: "#ffffff"
            text: "210"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element9
            x: 983
            y: 521
            color: "#ffffff"
            text: "240"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }

        Text {
            id: element10
            x: 953
            y: 713
            color: "#ffffff"
            text: "270"
            font.weight: Font.ExtraLight
            font.family: "Dosis"
            font.pixelSize: 63
        }
    }

    Item {
        id: pivot
        x: 475
        y: 477
        width: 200
        height: 200
        rotation: -115
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: needle
            x: 90
            y: -366
            width: 36
            height: 561
            anchors.bottom: pivot.verticalCenter
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "imports/cluster.psd/needle.png"
        }
        Glow {
            anchors.fill: needle
            radius: 15
            enabled: false
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
        x: 0
        y: 0
        width: 600
        height: 600
        smooth: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "imports/cluster.psd/cener_circle_219_37_219_37.png"

        Text {
            id: element11
            x: 157
            y: 212
            width: 563
            height: 124
            color: "#ffffff"
            text: "250"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.Light
            font.family: "Dosis"
            font.pixelSize: 150
        }

        Text {
            id: element12
            x: 159
            y: 219
            width: 76
            height: 33
            color: "#1d1d1d"
            text: "KM/H"
            anchors.verticalCenterOffset: -84
            anchors.horizontalCenterOffset: 1
            font.weight: Font.Light
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Dosis"
            font.pixelSize: 30
        }

        AbsIcon {
            id: absIcon
            x: 257
            y: 486
            width: 85
            height: 85
            active: true
        }

        BorderItem {
            id: element14
            x: 272
            y: 381
            width: 55
            height: 74
            strokeColor: "#1d1d1d"

            Label {
                id: label
                x: 12
                y: 6
                color: "#ffffff"
                text: "D"
                styleColor: "#950000"
                padding: 5
                font.pointSize: 30
                font.family: "Dosis"
            }
        }
    }

    Item {
        id: fuelUI
        x: 110
        y: 850
        width: 954
        height: 302
        anchors.horizontalCenter: bg_ind.horizontalCenter
        clip: false

        Image {
            id: oilGauge
            x: 99
            y: 112
            width: 732
            smooth: false
            anchors.horizontalCenterOffset: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "imports/cluster.psd/_path__219_45_219_45.png"
        }

        ArcItem {
            id: arc1
            x: 0
            y: -46
            width: 1140
            height: 1144
            begin: 218
            fillColor: "#00000000"
            strokeColor: "#0842c0"
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
            end: 219

            ParkingIcon {
                id: parkingIcon
                x: 261
                y: 766
                width: 85
                height: 85
                active: false
            }

            BatteryIcon {
                id: batteryIcon
                x: 799
                y: 776
                width: 65
                height: 65
                active: true
            }
        }

        Text {
            id: oilHigh
            x: 775
            y: 130
            text: "F"
            font.family: "Dosis"
            font.pixelSize: 50
        }

        Text {
            id: oilLow
            x: 146
            y: 130
            text: "E"
            font.family: "Dosis"
            font.pixelSize: 50
        }

        Text {
            id: element16
            x: 526
            y: 150
            color: "#909090"
            text: "| 30%"
            font.family: "Dosis"
            font.pixelSize: 20
        }

        FuelIcon {
            id: fuelIcon
            x: 435
            y: 120
            width: 85
            height: 85
        }

        Item {
            id: frameText
            x: 516
            y: 66
            width: 225
            height: 40
            visible: false

            Rectangle {
                id: rectangle
                color: "#00000000"
                radius: 20
                anchors.rightMargin: 0
                anchors.fill: parent
                border.color: "#1d1d1d"
                border.width: 3

                RowLayout {
                    id: row
                    anchors.fill: parent
                    spacing: 15
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                    Text {
                        id: element15
                        color: "#fdfdfd"
                        text: "Fuel range"
                        font.pixelSize: 15
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "Dosis"
                    }

                    Text {
                        id: element13
                        color: "#fdfdfd"
                        text: "180 km"
                        font.family: "Dosis"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.pixelSize: 25
                    }
                }
            }
        }

        Item {
            id: frameText1
            x: 202
            y: 66
            width: 225
            height: 40
            visible: false
            Rectangle {
                id: rectangle1
                color: "#00000000"
                radius: 20
                anchors.fill: parent
                border.color: "#1d1d1d"
                border.width: 3
                RowLayout {
                    id: row1
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Text {
                        id: element17
                        color: "#fdfdfd"
                        text: "Fuel consumption"
                        font.pixelSize: 15
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "Dosis"
                    }

                    Text {
                        id: element19
                        color: "#fdfdfd"
                        text: "50%"
                        font.pixelSize: 25
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "Dosis"
                    }
                    spacing: 15
                }
                anchors.rightMargin: 0
            }
        }

        Text {
            id: element18
            x: 363
            y: 150
            color: "#909090"
            text: "250 km |"
            font.pixelSize: 20
            font.family: "Dosis"
        }
    }

    Timeline {
        id: fuelTimeline
        currentFrame: 50
        animations: [
            TimelineAnimation {
                id: timelineAnimation1
                from: 1000
                to: 0
                loops: 1
                running: false
                duration: 1000
            }
        ]
        startFrame: 0
        enabled: true
        endFrame: 78

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

        KeyframeGroup {
            target: arc1
            property: "strokeColor"

            Keyframe {
                value: "#e6e73232"
                frame: 15
            }

            Keyframe {
                value: "#e7f08718"
                frame: 17
            }

            Keyframe {
                value: "#e7f08718"
                frame: 25
            }

            Keyframe {
                value: "#ffffff"
                frame: 27
            }

            Keyframe {
                value: "#e6e73232"
                frame: 0
            }
        }
    }
    Timeline {
        id: speedTimeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                from: 0
                to: 1000
                loops: 1
                running: false
                duration: 1000
            }
        ]
        startFrame: 0
        enabled: true
        endFrame: 270

        KeyframeGroup {
            target: pivot
            property: "rotation"
            Keyframe {
                value: -115
                frame: 0
            }

            Keyframe {
                value: -90
                frame: 30
            }

            Keyframe {
                value: 115
                frame: 270
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:1154;width:1150}D{i:34;anchors_height:40;anchors_width:400;anchors_x:0;anchors_y:0}
D{i:33;anchors_height:40;anchors_width:450;anchors_x:0;anchors_y:0}D{i:32;anchors_height:40;anchors_width:450;invisible:true}
D{i:39;anchors_height:40;anchors_width:400;anchors_x:0;anchors_y:0}D{i:38;anchors_height:40;anchors_width:450;anchors_x:0;anchors_y:0}
D{i:37;anchors_height:40;anchors_width:450;invisible:true}D{i:43}
}
##^##*/

