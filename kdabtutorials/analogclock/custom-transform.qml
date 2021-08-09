import QtQuick 2.0

Rectangle{
    width: 680; height: 240; color: 'lightblue'

    Rectangle {
        id: focusBox
        width: 200; height: 200
        color: focusArea.containsMouse ? 'green' : 'cyan'
        anchors{verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 20
        }
        Text {
            anchors.centerIn: parent
            text: 'Observe my color'
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 200; height: 200
        color: 'yellow'
        MouseArea {
            id: focusArea
            anchors.fill: parent
            hoverEnabled: true
        }
        Text {
            anchors.centerIn: parent
            text: 'Move\ninto me'
        }
    }

    Rectangle {
        anchors{right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: 20}
        width: 200; height: 200; color: 'black'

        MouseArea {id: clickArea; anchors.fill: parent; onClicked: focusBox.color = 'red'}

        Text{color: 'white'; anchors.centerIn: parent; text: 'Click\nme'}
    }

}
