import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    state: "emptystate"
    id: root

    // properties
    property int canTyrePressure: 0
    property int canABSMalfunction: 0
    property int canTPMS: 1
    property int canServiceMode: 0
    property int canFrontCollision: 0

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit
    }

     // add popup components into this item as they come
      Loader{
         PopUp {
             id: popup
             state: 'emptystate'
             SequentialAnimation {
                     NumberAnimation {target: popup; properties: 'opacity'; from: 0.0; to: 1.0; duration: 3000; easing.type: Easing.Linear}
                     NumberAnimation {target: popup; properties: 'opacity'; from: 1.0; to: 0.0; duration: 3000; easing.type: Easing.Linear}
                     running: true
             }
         }
     }
}
