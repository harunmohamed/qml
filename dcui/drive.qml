import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root

    // font loader
    FontLoader {id: titleFont; source: "font/orbitron-medium.ttf"}
    FontLoader {id: textFont; source: "font/orbitron-light.ttf"}

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

        OpacityAnimator {
            target: popup
            from: 0
            to: 1
            duration: 2000
            running: true
        }
    }

    // update popup function
    function updatePopUp() {
        if (viewCanTyrePressure == 1) {
            popup.popUpIndicator = "images/tyre.png";popup.popUpTitle = "Tyre Pressure Warning";popup.popUpMessage = "Check Tyre Pressure";
            viewCanTyrePressure = 0
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
