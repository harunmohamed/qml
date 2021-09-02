import QtQuick 2.9

// popup container
Rectangle {
    id: popupContainer
    border.color: '#cccccc'
    width: 423
    height: 82
    x: 749
    y: 498
    color: 'transparent'
    border.width: 2
    radius: 20

    // font loader
    FontLoader {id: titleFont; source: "font/orbitron-medium.ttf"}
    FontLoader {id: textFont; source: "font/futura-book-bt.ttf"}

    // properties for popup component: image, title and message
    property alias popUpIndicator : pindicator.source
    property alias popUpTitle : ptitle.text
    property alias popUpMessage : pmessage.text

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
            name: 'emptystate'
            PropertyChanges{target: popupContainer; border.color : 'transparent'}
        },
        State {
            name: 'tyrepressure'
            when: canTyrePressure == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/tyre.png"; popUpTitle : "Tyre Pressure Warning"; popUpMessage : "Check Tyre Pressure";}
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
            name: 'frontcollision'
            when: canFrontCollision == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/frontcollision.png"; popUpTitle : "Front Collision Warning"; popUpMessage : "Front Collision Imminent: Slow Down";}
        }
    ]
    // popup transitions
    transitions: [
        Transition {
            SequentialAnimation {
                NumberAnimation {target: popupContainer; properties: 'opacity'; from: 0.0; to: 1.0; duration: 2000; easing.type: Easing.Linear}
                PauseAnimation {duration: 2000}
                NumberAnimation {target: popupContainer; properties: 'opacity'; from: 1.0; to: 0.0; duration: 3000; easing.type: Easing.Linear}
            }
        }
    ]
}
