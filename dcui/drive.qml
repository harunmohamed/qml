import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root

    // properties
    property int tyrePressure: 0
    property int aBSMalfunction: 0
    property int tPMS: 0
    property int serviceMode: 0
    property int frontCollision: 1

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                popup.visible = true

            }
        }
    }

    PopUp {
        id: popup
        popUpIndicator: updatePopUp()
        popUpTitle: updatePopUp()
        popUpMessage: updatePopUp()
        visible: false
        SequentialAnimation {
                NumberAnimation {target: popup; properties: 'opacity'; from: 0.0; to: 1.0; duration: 3000; easing.type: Easing.Linear}
                NumberAnimation {target: popup; properties: 'opacity'; from: 1.0; to: 0.0; duration: 3000; easing.type: Easing.Linear}
                running: true
            }
    }

    // update popup function
    function updatePopUp() {
        popup.border.color = 'transparent'
        if (tyrePressure == 1) {
            popup.popUpIndicator = "images/tyre.png"; popup.popUpTitle = "Tyre Pressure Warning"; popup.popUpMessage = "Check Tyre Pressure"; popup.border.color = '#cccccc'
        } else if (aBSMalfunction == 1) {
            popup.popUpIndicator = "images/abs.png"; popup.popUpTitle = "ABS Malfunction"; popup.popUpMessage = "Braking System Failure"; popup.border.color = '#cccccc'
        } else if (tPMS == 1) {
            popup.popUpIndicator = "images/tpms.png"; popup.popUpTitle = "TPMS Malfunction"; popup.popUpMessage = "Check TPM"; popup.border.color = '#cccccc'
        } else if (serviceMode == 1) {
            popup.popUpIndicator = "images/servicemode.png"; popup.popUpTitle = "Service Mode Active"; popup.popUpMessage = "Service Mode Activated"; popup.border.color = '#cccccc'
        } else if (frontCollision == 1) {
            popup.popUpIndicator = "images/frontcollision.png"; popup.popUpTitle = "Front Collision Warning"; popup.popUpMessage = "Slow Down"; popup.border.color = '#cccccc'
        }
    }
}
