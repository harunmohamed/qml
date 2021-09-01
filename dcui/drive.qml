import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root

    // properties
    property int canTyrePressure: 0
    property int canABSMalfunction: 0
    property int canTPMS: 0
    property int canServiceMode: 0
    property int canFrontCollision: 1

    // background image
    Image {
        id: driveScreen
        source: "images/driveScreen.png"
        width: root.width;
        height: root.height
        fillMode: Image.PreserveAspectFit

        MouseArea { anchors.fill: parent; onClicked: popup.updatePopUp() }
    }

    PopUp {
        id: popup
        state: 'tyrepressure'
        SequentialAnimation {
                NumberAnimation {target: popup; properties: 'opacity'; from: 0.0; to: 1.0; duration: 3000; easing.type: Easing.Linear}
                NumberAnimation {target: popup; properties: 'opacity'; from: 1.0; to: 0.0; duration: 3000; easing.type: Easing.Linear}
                running: true
        }
        // update popup function
        function updatePopUp() {
            popup.border.color = 'transparent'
            if ( canTyrePressure == 1 ) { popup.state = 'tyrepressure' }
            else if ( canABSMalfunction == 1 ) { popup.state = 'absmalfunction' }
            else if ( canTPMS == 1) { popup.state = 'tpms' }
            else if ( canServiceMode == 1 ) { popup.state = 'servicemode' }
            else if ( canFrontCollision == 1 ) { popup.state = 'frontcollision' }
        }
    }

    // states
    states: [
        State {
            name: 'tyrepressure'
            PropertyChanges{target: popup; popUpIndicator: "images/tyre.png"; popUpTitle : "Tyre Pressure Warning"; popUpMessage : "Check Tyre Pressure"; border.color : '#cccccc'}
        },
        State {
            name: 'absmalfunction'
            PropertyChanges{target: popup; popUpIndicator: "images/abs.png"; popUpTitle : "ABS Malfunction"; popUpMessage : "Braking System Failure"; border.color : '#cccccc'}
        },
        State {
            name: 'tpms'
            PropertyChanges{target: popup; popUpIndicator: "images/tpms.png"; popUpTitle : "TPMS Malfunction"; popUpMessage : "Check TPM"; border.color : '#cccccc'}
        },
        State {
            name: 'servicemode'
            PropertyChanges{target: popup; popUpIndicator: "images/servicemode.png"; popUpTitle : "Service Mode Active"; popUpMessage : "Service Mode Activated"; border.color : '#cccccc'}
        },
        State {
            name: 'frontcollision'
            PropertyChanges{target: popup; popUpIndicator: "images/frontcollision.png"; popUpTitle : "Front Collision Warning"; popUpMessage : "Slow Down"; border.color : '#cccccc';}
        }
    ]
}
