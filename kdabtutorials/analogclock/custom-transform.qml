import QtQuick 2.9

Rectangle {
    width: 400; height: 400
    color: '#000040'

    Image {
        id: rocket
        anchors.centerIn: parent
        source: 'rocket.svg'
    }
    SequentialAnimation {
        NumberAnimation {target: rocket; properties: 'scale'; from: 1.0; to: 0.5; duration: 1000}
        NumberAnimation {target: rocket; properties: 'opacity'; from: 1.0; to: 0.0; duration: 1000}
        running: true
    }
}
