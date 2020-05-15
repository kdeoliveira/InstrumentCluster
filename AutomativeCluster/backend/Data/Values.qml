pragma Singleton
//import App 1.0
import QtQuick 2.12

QtObject {
    id: values

    // Controls all properties of AutomativeCluster.qml
    property int rpm: AppValues.rpm //Controls the RPM frames
    property string displayRPM: rpm.toString() // Controls the display of RPM
    property bool rpmIcon: (rpm >= 7000) ? true : false

    property int oilTemp: 40
    property bool oilTempIcon: true

    property int fuelLevel: 18
    property bool fuelLevelIcon: (fuelLevel <= 20) ? true : false

    property int speed: AppValues.speed
    property string displaySpeed: speed.toString()

    property bool parkingIcon: false
    property bool batteryIcon: false

    property bool leftArrow: false
    property bool rightArrow: false
    property bool alertArrow: false

    property string fuelPercentage: (Math.round((fuelLevel / 78) * 100)).toString() + " %"

    // Booting
    property bool booting: true
    readonly property real bootDuration: 5000

    Component.onDestruction: {
        print(rpm)
        print("Printing from context: ", AppValues.rpm)
//        AppValues.rpm = 1250
    }
}


/*##^##
Designer {
    D{i:0;formeditorColor:"#000000";formeditorZoom:0.6600000262260437}
}
##^##*/
