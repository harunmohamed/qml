import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Drag and Drop Application")

    Rectangle{

        id: myShape
        width: 100
        height: 100
        color: 'orange'

        function update(){
            console.log(x + ' x ' + y)
            label.text = Math.round(x) + " x " + Math.round(y)
        }

        //anchors.centerIn: parent
        Component.onCompleted: update()
        x: 100
        y:100

        onXChanged: update()
        onYChanged: update()

        Text{
            id: label
            text: qsrt('text')
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill: parent
            drag.target: parent
        }
    }

    Grid{
        spacing: 2
        rows: 3
        columns: 3
        anchors.centerIn: parent
        MyShape{color: 'red'}
        MyShape{color: 'orange'}
        MyShape{color: 'yellow'}
        MyShape{color: 'green'}
        MyShape{color: 'blue'}
        MyShape{color: 'indigo'}
        MyShape{color: 'violet'}
        MyShape{color: 'teal'}
        MyShape{color: 'gold'}
    }
}
