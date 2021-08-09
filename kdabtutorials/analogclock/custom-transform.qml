import QtQuick 2.7

Rectangle {
    width: 400; height: 400; color: '#00a3fc'
    focus: true

    Image {
        id: rocket
        anchors.centerIn: parent
        source: 'rocket.svg'
    }
    Keys.onPressed:
        if (event.key === Qt.Key_Left)
            rocket.rotation = (rocket.rotation - 10) % 360
        else if (event.key === Qt.Key_Right)
            rocket.rotation = (rocket.rotation + 10) % 360

}
