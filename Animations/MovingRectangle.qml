import QtQuick 2.0
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Drag and Drop")

    Item {
        anchors.fill: parent
        focus: true

        Rectangle {
            id: box
            color: 'red'
            width: 100
            height: 100

        }

        Keys.onUpPressed: box.y = box.y - 5
        Keys.onDownPressed: box.y = box.y + 5
        Keys.onLeftPressed: box.x = box.x - 5
        Keys.onRightPressed: box.x = box.x + 5
    }
}
