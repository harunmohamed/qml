import QtQuick 2.9


Rectangle{
    width: 420; height: 420; color: 'black';

    Grid {
        x: 5; y: 5; rows: 5; columns: 5; spacing: 15

        Repeater {
            model: 24
            delegate: Rectangle {
                width: 70
                height: 70
                color: 'lightgreen'
            }
        }
    }
}
