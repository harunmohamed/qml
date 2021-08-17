import QtQuick 2.9

Rectangle {
    width: 1600; height: 600
    color: 'black'
    id: root

    Rectangle {
        id: square
        width: 50; height: 50;
        x: (root.width - width) / 2
        y: (root.height - height) / 2
        color: 'lightsteelblue'
    }
    focus: true
    Keys.onLeftPressed: square.x -= 8
    Keys.onRightPressed: square.x += 8
    Keys.onUpPressed: square.y -= 8
    Keys.onDownPressed: square.y += 8
    Keys.onPressed: {
        switch(event.key){
        case Qt.Key_Plus: square.scale += 2
            break;
        case Qt.Key_Minus: square.scale -= 2
            break;
        }
    }
}
