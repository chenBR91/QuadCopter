import QtQuick 2.15
import QtQuick.Controls 2.15
import "components/BottomBar"
import "components/RightScreen"
import "components/LeftScreen"

ApplicationWindow { 
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("QuadCopter")
    
    property QtObject backend
    property string currTime: "00:00:00"
    property string currDay: ""
    property string currForecast: ""
    property string droneName: ""
    property int batteryLevel: -1
    property int batteryLevelPc: -1

    LeftScreen {
        id: leftScreen
        droneName: window.droneName
        batteryLevel: window.batteryLevel
        batteryLevelPc: window.batteryLevelPc
    }
    
    RightScreen {
        id: rightScreen
    }

    BottomBar {
        id: bottomBar
        onDroneIconClicked: leftScreen.droneInfoVisible = !leftScreen.droneInfoVisible
    }

    Connections {
        target: window.backend

        function onNameDroneUpdated(params) {
            window.droneName = params;
        }

        function onBatteryUpdated(params) {
            window.batteryLevel = params
        }

        function onCurrentBatteryCharge(params) {
            window.batteryLevelPc = params
        }
    }
}