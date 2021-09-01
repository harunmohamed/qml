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
    }

    PopUp {
        id: popup
        state: 'emptystate'
        SequentialAnimation {
                NumberAnimation {target: popup; properties: 'opacity'; from: 0.0; to: 1.0; duration: 3000; easing.type: Easing.Linear}
                NumberAnimation {target: popup; properties: 'opacity'; from: 1.0; to: 0.0; duration: 3000; easing.type: Easing.Linear}
                running: true
        }
    }

    // states
    states: [
        State {
            name: 'emptystate'
            PropertyChanges{target: popup; border.color : 'transparent'}
        },
        State {
            name: 'tyrepressure'
            when: canTyrePressure == 1
            PropertyChanges{target: popup; popUpIndicator: "images/tyre.png"; popUpTitle : "Tyre Pressure Warning"; popUpMessage : "Check Tyre Pressure"; border.color : '#cccccc'}
        },
        State {
            name: 'absmalfunction'
            when: canABSMalfunction == 1
            PropertyChanges{target: popup; popUpIndicator: "images/abs.png"; popUpTitle : "ABS Malfunction"; popUpMessage : "Braking System Failure"; border.color : '#cccccc'}
        },
        State {
            name: 'tpms'
            when: canTPMS == 1
            PropertyChanges{target: popup; popUpIndicator: "images/tpms.png"; popUpTitle : "TPMS Malfunction"; popUpMessage : "Check TPM"; border.color : '#cccccc'}
        },
        State {
            name: 'servicemode'
            when: canServiceMode == 1
            PropertyChanges{target: popup; popUpIndicator: "images/servicemode.png"; popUpTitle : "Service Mode Active"; popUpMessage : "Service Mode Activated"; border.color : '#cccccc'}
        },
        State {
            name: 'frontcollision'
            when: canFrontCollision == 1
            PropertyChanges{target: popup; popUpIndicator: "images/frontcollision.png"; popUpTitle : "Front Collision Warning"; popUpMessage : "Slow Down"; border.color : '#cccccc';}
        }
    ]
}
