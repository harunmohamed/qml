import QtQuick 2.9

Rectangle {
    width: 250; height: 50
    color: "lightblue"

    TextInput {
        id: textField
        text: 'enter text ...'
        font.pointSize: 24
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: clearButton
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.verticalCenter: textField.verticalCenter
        text: '<b>X</b>'
        font.pixelSize: 24

        MouseArea {
            anchors.fill: parent
            onClicked: textField.text = ''
        }
    }
    states: [
        State {
            when: textField.text !== ''
            PropertyChanges {target: clearButton; opacity: 1.0}
        },
        State {
            when: textField.text === ''
            PropertyChanges {target: clearButton; opacity: 0.25}
            PropertyChanges {target: textField; focus: true}
        }
    ]
}
