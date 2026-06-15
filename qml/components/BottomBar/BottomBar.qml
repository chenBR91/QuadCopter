import QtQuick 2.15


Rectangle {
        id: bottomBar
        signal droneIconClicked()

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: "black"
        height: parent.height / 12

        Image {
            id: dronSettingIcon
            anchors {
                left: parent.left
                leftMargin: 30
                verticalCenter: parent.verticalCenter
            }
            height: parent.height * 0.85
            fillMode: Image.PreserveAspectFit
            source: "../assests/drone_1.png"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: bottomBar.droneIconClicked()
            }
        }

        Image {
            id: dronMapIcon
            anchors {
                left: parent.left
                leftMargin: 130
                verticalCenter: parent.verticalCenter
            }
            height: parent.height * 0.85
            fillMode: Image.PreserveAspectFit
            source: "../assests/mapIcon1.png"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: bottomBar.droneIconClicked()
            }
        }
    }