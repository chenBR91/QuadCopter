import QtQuick 2.15

Rectangle {
        id: leftScreen
        property bool droneInfoVisible: false

        // Drone data — bind from parent via leftScreen.droneName = ...
        property string droneName: ""
        property string droneType: "QuadCopter" 
        property string droneVersion: "v2.4.1"
        property int batteryLevel: -1

        anchors {
            left: parent.left
            right: rightScreen.left
            bottom: bottomBar.top
            top: parent.top
        }

        color: "white"

        Image {
            id: droneRender
            anchors.centerIn: parent
            width: parent.width * 0.75
            fillMode: Image.PreserveAspectFit
            source: "../assests/droneRender.png"
        }

        DronePanel {
            id: droneInfoPanel
            visible: leftScreen.droneInfoVisible
            droneName: leftScreen.droneName
            droneType: leftScreen.droneType
            droneVersion: leftScreen.droneVersion
            batteryLevel: leftScreen.batteryLevel
        }

    }
