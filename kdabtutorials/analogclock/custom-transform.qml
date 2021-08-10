import QtQuick 2.9

Rectangle {
    width: 400; height: 400
    color: 'lightblue'

    Rectangle {
        id: rect
        x: 300; y: 300; width:100; height: 100
    }
    NumberAnimation {
        target: rect
        properties: 'x, y'
        to: 150
        duration: 1000
        running: true
    }


}
