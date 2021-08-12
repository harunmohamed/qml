import QtQuick 2.9


Grid {
    x: 15; y: 15; width: 300; height: 300
    columns: 2; rows: 2; spacing: 20;

    property int dims: 125

    Rectangle {width: dims;height: dims;color: 'red';}
    Rectangle {width: dims;height: dims;color: 'green';}
    Rectangle {width: dims;height: dims;color: 'silver';}
    Rectangle {width: dims;height: dims;color: 'blue';}
}
