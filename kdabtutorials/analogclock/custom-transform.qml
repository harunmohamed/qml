import QtQuick 2.9

Rectangle {
    width: 200; height: 200
    color: '#000040'

    Flipable {
        id: flipable
        anchors.centerIn: parent
        property bool flipped: false

        front: Rectangle {
            color: 'green'
            width: 100; height: 100
            anchors.centerIn: parent
        }
        back: Rectangle {
            color: 'red'
            width: 100; height: 100;
            anchors.centerIn: parent
        }
        transform: Rotation {
            axis.x: 1; axis.y: 0; axis.z: 0
            angle: flipable.flipped ? 180 : 0

            Behavior on angle {
                NumberAnimation {duration: 300}
            }
        }
    }
    Text {
        text: flipable.side == Flipable.Front ? 'Front' : 'Back'
        anchors {
            bottom: parent.bottom
        }
        color: 'white'
    }
    MouseArea {
        anchors.fill: parent
        onClicked: flipable.flipped = !flipable.flipped
    }
}
