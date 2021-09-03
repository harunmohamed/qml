import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    state: "emptystate"
    id: root

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit
    }

     // add popup components into this item as they come
     Loader {
         id: loader
         PopUp { id: popup }
         onLoaded: {}
     }
}
