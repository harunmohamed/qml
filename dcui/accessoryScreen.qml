import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root

    // background image
    Image {
        id: driveScreen
        source: "images/accessoryScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit
    }

     // This little component loads all the popups we'll ever need
     PopUp { x: 135;y: 319}
}
