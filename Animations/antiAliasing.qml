import QtQuick 2.0
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Antialiasing demo")
    id: root

    Row {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 200
            height: 200
            border.color: 'red'
            border.width: 20
            radius: width

            Text {
                anchors.centerIn: parent
                text: qsTr("Turned On")
            }
        }

        Rectangle {
            width: 200
            height: 200
            border.color: 'red'
            border.width: 20
            radius: width
            antialiasing: false

            Text {
                anchors.centerIn: parent
                text: qsTr("Turned Off")
            }
        }
    }
}
