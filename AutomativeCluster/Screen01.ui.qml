import QtQuick 2.12
import AutomativeCluster 1.0
import Data 1.0 as Data
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.0
import QtQuick.Timeline 1.0
import QtQuick.Studio.Effects 1.0

Rectangle {
    id: rectangle

    Material.theme: Material.Light
    Material.foreground: "white"
    Material.accent: "red"

    width: Constants.width
    height: Constants.height
    color: "#000000"

    Cluster {
        id: cluster
        smooth: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    BottomCluster {
        id: element
        x: 1241
        y: 1035
        anchors.horizontalCenter: cluster.horizontalCenter
    }

    Tachimeter {
        id: tachimeter
        x: 85
        y: 141
        displayRPM: Data.Values.displayRPM
        rpmTimeline: Data.Values.rpm
        rpmIcon: Data.Values.rpmIcon
        oilTempIcon: Data.Values.oilTempIcon
        oilTimeline: Data.Values.oilTemp
        antialiasing: false
        smooth: false
        anchors.right: cluster.left
        anchors.rightMargin: -1235
        transformOrigin: Item.Center
        anchors.verticalCenter: cluster.verticalCenter
    }

    Speedometer {
        id: speedometer
        y: 143
        smooth: false
        fuelPercentage: Data.Values.fuelPercentage
        fuelIcon: Data.Values.fuelLevelIcon
        fuelTimeline: Data.Values.fuelLevel
        anchors.left: cluster.right
        anchors.leftMargin: -1235
        speedTimeline: Data.Values.speed
        displaySpeed: Data.Values.displaySpeed
        parkingIcon: Data.Values.parkingIcon
        batteryIcon: Data.Values.batteryIcon
        anchors.verticalCenter: cluster.verticalCenter
    }

    TopCluster {
        id: topCluster
        x: 183
        width: 954
        height: 90
        smooth: false
        alertArrow: Data.Values.alertArrow
        leftArrow: Data.Values.leftArrow
        rightArrow: Data.Values.rightArrow
        anchors.top: cluster.bottom
        anchors.topMargin: -1255
        anchors.horizontalCenter: cluster.horizontalCenter
    }

    Item {
        id: controlsUI
        x: 1176
        y: 1154
        width: 200
        height: 200
        smooth: false

        Button {
            id: button3

            Material.background: "blue"
            Material.foreground: "white"

            x: 279
            y: 37
            width: 50
            text: "P"
            smooth: false
            flat: true
            font.preferShaping: true
            font.bold: true
            enabled: true
            display: AbstractButton.TextOnly
            checkable: true
            Connections {
                target: button3
                onClicked: {
                    if (button3.checked) {
                        Data.Values.parkingIcon = true
                    } else {
                        Data.Values.parkingIcon = false
                    }
                }
            }
        }

        Connections {
            target: button2
            onClicked: {
                if (button2.checked) {
                    Data.Values.rightArrow = true
                    button1.checkable = false
                } else {
                    Data.Values.rightArrow = false
                    button1.checkable = true
                }
            }
        }

        Button {
            id: button2
            x: 383
            y: 91
            text: ">"
            checkable: true
        }

        Connections {
            target: button1
            onClicked: {
                if (button1.checked) {
                    Data.Values.leftArrow = true
                    button2.checkable = false
                } else {
                    Data.Values.leftArrow = false
                    button2.checkable = true
                }
            }
        }

        Button {
            id: button1
            x: 151
            y: 91
            text: "<"
            checkable: true
        }

        Slider {
            id: slider1
            x: 39
            y: 195
            width: 531
            height: 40
            to: 270
            stepSize: 1
            snapMode: Slider.NoSnap
            value: 1
        }

        Connections {
            target: button
            onClicked: {
                if (button.checked) {
                    Data.Values.leftArrow = false
                    Data.Values.rightArrow = false
                    Data.Values.leftArrow = true
                    Data.Values.rightArrow = true
                    print("Active")
                } else {
                    Data.Values.leftArrow = false
                    Data.Values.rightArrow = false
                    print("Deactivate")
                }
            }
        }

        Button {
            id: button
            x: 227
            y: 91
            text: "Test Alert Lights"
            checkable: true
        }

        Slider {
            id: slider
            x: 39
            y: 149
            width: 531
            height: 40

            stepSize: 1
            to: 8000
            value: 1
        }
    }

    DropShadowItem {
        id: dropShadow
        x: 1400
        y: 732
        enabled: false
        smooth: false

        Image {
            id: image
            x: -107
            y: -145
            visible: false
            enabled: false
            smooth: false
            opacity: 1
            fillMode: Image.PreserveAspectFit
            source: "imports/cluster.psd/Peugeot_Logo.png"
        }
    }

    Timeline {
        id: bootTimeline
        endFrame: 5000
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 5000
                to: 5000
                running: true
                from: 0
                loops: 1
            }
        ]
        startFrame: 0
        enabled: false

        KeyframeGroup {
            target: image
            property: "opacity"
            Keyframe {
                value: 1
                frame: 1500
            }

            Keyframe {
                value: 1
                frame: 4000
            }

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 4750
            }
        }
    }

    Connections {
        target: timelineAnimation
        onFinished: {
            print("clicked")
            Data.Values.booting = false
            rectangle.state = "runningState"
        }
    }

    states: [
        State {
            name: "bootState"
            when: Data.Values.booting

            PropertyChanges {
                target: bootTimeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }

            PropertyChanges {
                target: controlsUI
                width: 624
                height: 267
                smooth: false
                visible: false
            }

            PropertyChanges {
                target: image
                x: 421
                y: 294
                enabled: false
                visible: true
                opacity: 0
            }

            PropertyChanges {
                target: cluster
                visible: true
            }

            PropertyChanges {
                target: element
                smooth: false
                visible: false
            }

            PropertyChanges {
                target: tachimeter
                visible: false
            }

            PropertyChanges {
                target: speedometer
                visible: false
            }

            PropertyChanges {
                target: topCluster
                smooth: false
                visible: false
            }

            PropertyChanges {
                target: dropShadow
                x: 840
                y: 282
                width: 1216
                height: 853
                color: "#ffffff"
                radius: 10
                transparentBorder: true
                smooth: false
                horizontalOffset: 0
                samples: 20
                spread: 0.15
            }
        },
        State {
            name: "runningState"
            when: !Data.Values.booting

            PropertyChanges {
                target: image
                x: 1293
                y: 587
            }

            PropertyChanges {
                target: topCluster
                smooth: false
            }

            PropertyChanges {
                target: controlsUI
                smooth: false
            }
        }
    ]
}
