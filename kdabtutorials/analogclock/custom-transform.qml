import QtQuick 2.7

Rectangle {
    width: 400; height: 400; color: '#00a3fc'
    focus: true

    LineEdit{
        id: lineEdit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 16
        width: 300
        height: 50
        clip: true
    }

    Text {
        anchors.top: lineEdit.bottom
        anchors.topMargin: 12
        anchors.left: parent.left
        anchors.leftMargin: 16
        text: '<b>Summary:</b> ' + lineEdit.text
    }

    Text {
        id: clearButton
        text: '<b>X</b>'
        font.pixelSize: 40
        opacity: lineEdit.text === "" ? 0.25 : 1.0
        color: lineEdit.text === "" ? 'black' : 'darkred'
        anchors {
            right: parent.right
            rightMargin: 10
            verticalCenter: lineEdit.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: lineEdit.text = ''
        }
    }
}


