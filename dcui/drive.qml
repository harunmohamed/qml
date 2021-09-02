import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    state: "emptystate"
    id: root

    // properties
    property int canTyrePressure: 1
    property int canABSMalfunction: 0
    property int canTPMS: 1
    property int canServiceMode: 0
    property int canFrontCollision: 1

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit
    }

     // add popup components into this item as they come
     PopUp {
         id: popup
         Loader {}
     }
}
