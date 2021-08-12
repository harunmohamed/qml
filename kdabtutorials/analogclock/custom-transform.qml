import QtQuick 2.9


Rectangle {
    width: 400; height: 400; color: 'black';

    Component {
        id: rectangleComponent

        Rectangle {
            width: 70; height: 70; color: 'lightgreen'
            Text {
                anchors.centerIn: parent
                text: model.index
                font.pointSize: 30
            }
        }
    }

    Grid {
        x: 5; y: 5; rows: 5; columns: 5; spacing: 10;

        Repeater {
            model: 24
            delegate: rectangleComponent
        }
    }
}
