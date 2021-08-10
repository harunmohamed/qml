import QtQuick 2.9

Rectangle {
    width: 400; height: 400
    color: 'lightblue'

    Rectangle {
        id: rect
        x: 100
        y: 100
        width: 50
        height: 50
        color: 'red'

        Behavior on x {
            SpringAnimation {spring: 1; damping: 0.2}
        }
        Behavior on y {
            SpringAnimation {spring: 1; damping: 0.2}
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.x = mouse.x - rect.width / 2
            rect.y = mouse.y - rect.height / 2
        }
    }
}
