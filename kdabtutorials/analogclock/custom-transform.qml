import QtQuick 2.7

Rectangle {
    width: 400; height: 400; color: '#00a3fc'
    focus: true

    Image {
        id: rocket
        source: 'rocket.svg'
        x: parent.width / 3
        y: parent.height / 3
    }
    Keys.onPressed:
        if (event.key === Qt.Key_Left)
            rocket.rotation = (rocket.rotation - 10) % 360
        else if (event.key === Qt.Key_Right)
            rocket.rotation = (rocket.rotation + 10) % 360
        else if(event.key === Qt.Key_Up)
            rocket.y = rocket.y + 10
        else if(event.key === Qt.Key_Down)
            rocket.y = rocket.y - 10
}
