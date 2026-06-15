import QtQuick 2.15

Rectangle {
    id: droneInfoPanel

    property string droneName: ""
    property string droneType: ""
    property string droneVersion: ""
    property int batteryLevel: -1
    property int batteryLevelPc: -1

    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }
    width: 210
    color: "#12131a"

    Column {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 16
        }
        spacing: 0

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

        Text { text: "NAME"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
        Item { width: 1; height: 4 }
        Text { text: droneInfoPanel.droneName; color: "#ffffff"; font.pixelSize: 14; font.bold: true }

        Item { width: 1; height: 16 }

        Text { text: "TYPE"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
        Item { width: 1; height: 4 }
        Text { text: droneInfoPanel.droneType; color: "#ffffff"; font.pixelSize: 14 }

        Item { width: 1; height: 16 }

        Text { text: "VERSION"; color: "#666"; font.pixelSize: 10; font.letterSpacing: 1 }
        Item { width: 1; height: 4 }
        Text { text: droneInfoPanel.droneVersion; color: "#ffffff"; font.pixelSize: 14 }

        Item { width: 1; height: 16 }

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
                    width: parent.width * Math.max(0, droneInfoPanel.batteryLevelPc / 100)
                    height: parent.height
                    radius: parent.radius
                    color: droneInfoPanel.batteryLevelPc > 50 ? "#00cc66"
                         : droneInfoPanel.batteryLevelPc > 20 ? "#ffaa00"
                         : "#ff3333"
                }
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: droneInfoPanel.batteryLevelPc + "%"
                color: "#ffffff"
                font.pixelSize: 12
                font.bold: true
            }
        }
    }
}
