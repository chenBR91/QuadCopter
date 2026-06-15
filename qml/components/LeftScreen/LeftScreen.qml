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

        Rectangle {
            id: droneInfoPanel
            visible: leftScreen.droneInfoVisible
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: 210
            color: "#12131a"
            radius: 0

            Column {
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    margins: 16
                }
                spacing: 0

                // Header
                Item {
                    width: parent.width
                    height: 48
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "DRONE INFO"
                        color: "#00d4ff"
                        font.pixelSize: 13
                        font.bold: true
                        font.letterSpacing: 2
                    }
                }

                Rectangle { width: parent.width; height: 1; color: "#00d4ff"; opacity: 0.3 }

                Item { width: 1; height: 20 }

                // Name
                Text { text: "NAME"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
                Item { width: 1; height: 4 }
                Text { text: leftScreen.droneName; color: "#ffffff"; font.pixelSize: 14; font.bold: true }

                Item { width: 1; height: 16 }

                // Type
                Text { text: "TYPE"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
                Item { width: 1; height: 4 }
                Text { text: leftScreen.droneType; color: "#ffffff"; font.pixelSize: 14 }

                Item { width: 1; height: 16 }

                // Version
                Text { text: "VERSION"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
                Item { width: 1; height: 4 }
                Text { text: leftScreen.droneVersion; color: "#ffffff"; font.pixelSize: 14 }

                Item { width: 1; height: 16 }

                // Battery
                Text { text: "BATTERY"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
                Item { width: 1; height: 6 }

                Row {
                    spacing: 8
                    Rectangle {
                        width: 130
                        height: 10
                        radius: 5
                        color: "#2a2a2a"
                        Rectangle {
                            width: parent.width * (leftScreen.batteryLevel / 100)
                            height: parent.height
                            radius: parent.radius
                            color: leftScreen.batteryLevel > 50 ? "#00cc66"
                                 : leftScreen.batteryLevel > 20 ? "#ffaa00"
                                 : "#ff3333"
                        }
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: leftScreen.batteryLevel + "%"
                        color: "#ffffff"
                        font.pixelSize: 12
                        font.bold: true
                    }
                }
            }
        }

    }
