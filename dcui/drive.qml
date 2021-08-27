import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root

    // font loader
    FontLoader {id: titleFont; source: "font/orbitron-medium.ttf"}
    FontLoader {id: textFont; source: "font/orbitron-light.ttf"}

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit

    }

    PopUp {
        popUpIndicator: 'carready.png'
        popUpTitle: 'Tire Pressure Warning'
        popUpMessage: 'Adjust Tire Pressure'
    }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
