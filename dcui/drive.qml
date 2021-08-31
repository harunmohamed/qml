import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root

    // properties
    property int viewCanTyrePressure: 1

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit
    }

    PopUp {
        id: popup
        popUpIndicator: updatePopUp()
        popUpTitle: updatePopUp()
        popUpMessage: updatePopUp()
        SequentialAnimation {
                NumberAnimation {target: popup; properties: 'opacity'; from: 0.0; to: 1.0; duration: 3000; easing.type: Easing.Linear}
                NumberAnimation {target: popup; properties: 'opacity'; from: 1.0; to: 0.0; duration: 3000; easing.type: Easing.Linear}
                running: true
            }
    }

    // update popup function
    function updatePopUp() {
        popup.border.color = 'transparent'
        if (viewCanTyrePressure == 1) {
            popup.popUpIndicator = "images/tyre.png";
            popup.popUpTitle = "Tyre Pressure Warning";
            popup.popUpMessage = "Check Tyre Pressure";
            popup.border.color = '#cccccc'
        }
    }
}
