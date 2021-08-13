import QtQuick 2.9

Rectangle {
    width: 240; height: 240; color: 'black'
    property variant colorArray: ['red', 'green', 'violet']
    id: root

    Grid {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4
        Repeater {
            model: 16
            Rectangle {
                width: 56; height: 56
                property int colorIndex: Math.floor(Math.random() * 3)
                color: root.colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text {
                    anchors.centerIn: parent
                    color: '#f0f0f0'
                    text: 'Cell ' + index
                }
            }
        }
    }
}
