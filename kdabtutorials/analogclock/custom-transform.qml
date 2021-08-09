import QtQuick 2.0

Rectangle{
    width: 400; height: 300; color: 'lightblue'

    Text {
        text: 'Press Me!'
        font.pixelSize: 48
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40
        height: parent.height

        MouseArea {
            onPressed: parent.color = 'green'
            onReleased: parent.color = 'black'
            anchors.fill: parent
        }
    }

    Text{
        text: 'Click Me'
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 2
        height: parent.height / 2
        font.pixelSize: 48

        MouseArea {
            anchors.fill: parent
            onClicked: parent.font.bold = !parent.font.bold
        }
    }

}
