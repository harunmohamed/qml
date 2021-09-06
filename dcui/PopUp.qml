import QtQuick 2.9

// popup container
Rectangle {
    id: popupContainer
    border.color: state == '' ? 'transparent' : '#cccccc'
    width: 423
    height: 82
    x: 749
    y: 498
    color: 'transparent'
    border.width: 2
    radius: 20

    // properties for CAN signals
    property int canTyrePressure: 0
    property int canABSMalfunction: 0
    property int canTPMS: 1
    property int canServiceMode: 0
    property int canFrontCollision: 0

    // properties for popup component: image, title and message
    property alias popUpIndicator : pindicator.source
    property alias popUpTitle : ptitle.text
    property alias popUpMessage : pmessage.text

    // font loader
    FontLoader {id: titleFont; source: "font/orbitron-medium.ttf"}
    FontLoader {id: textFont; source: "font/futura-book-bt.ttf"}


    // popup image
    Image {
            id: pindicator
            x: 49
            y: 8
            width: 66
            height: 66
            verticalAlignment: parent.verticalCenter
    }
    // popup text contianer
    Rectangle {
        id: messages
        // popup title
        Text {
            id: ptitle
            y: 15
            color: '#cccccc'
            font.family: titleFont.name
            font.capitalization: Font.AllUppercase
            font.pixelSize: 17
            anchors.leftMargin: 125
            anchors.left: messages.left
        }
        // popup message
        Text {
            id: pmessage
            y: 40
            color: '#cccccc'
            font.family: textFont.name
            font.pixelSize: 18
            anchors.leftMargin: 125
            anchors.left: messages.left
        }

     }
    // popup states
    states: [
        State {
            name: 'frontcollision'
            when: canFrontCollision == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/frontcollision.png"; popUpTitle : "Front Collision Warning"; popUpMessage : "Front Collision Imminent: Slow Down";}
        },
        State {
            name: 'absmalfunction'
            when: canABSMalfunction == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/abs.png"; popUpTitle : "ABS Malfunction"; popUpMessage : "Braking System Failure";}
        },
        State {
            name: 'tpms'
            when: canTPMS == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/tpms.png"; popUpTitle : "TPMS Malfunction"; popUpMessage : "Check TPM";}
        },
        State {
            name: 'servicemode'
            when: canServiceMode == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/servicemode.png"; popUpTitle : "Service Mode Active"; popUpMessage : "Service mode has been activated";}
        },
        State {
            name: 'tyrepressure'
            when: canTyrePressure == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/tyre.png"; popUpTitle : "Tyre Pressure Warning"; popUpMessage : "Check Tyre Pressure";}
        }
    ]
    // popup transitions
    transitions: [
        Transition {
            SequentialAnimation {
                NumberAnimation {target: popupContainer; properties: 'opacity'; from: 0.0; to: 1.0; duration: 2000; easing.type: Easing.InOutQuad}
                PauseAnimation {duration: 1000}
                NumberAnimation {target: popupContainer; properties: 'opacity'; from: 1.0; to: 0.0; duration: 2000; easing.type: Easing.InOutQuad}
            }
            onRunningChanged: {
                if ((canTyrePressure == 1) && (!running)) {state = 'tyrepressure'; canTyrePressure = 0;}
                if ((canABSMalfunction == 1) && (!running)) {state = 'absmalfunction'; canABSMalfunction = 0;}
                if ((canTPMS == 1) && (!running)) {state = 'tpms'; canTPMS = 0;}
                if ((canServiceMode == 1) && (!running)) {state = 'servicemode'; canServiceMode = 0;}
                if ((canFrontCollision == 1) && (!running)) {state = 'frontcollision'; canFrontCollision = 0;}
            }
        }
    ]
}
