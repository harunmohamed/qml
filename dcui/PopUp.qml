import QtQuick 2.9

// POPUP CONTAINER: contains the whole popup component to be imported to other screens.
// Predefined positioning for the eco and cool mode screens. define x = 135 and y = 320 for the wake up screen and mouflon mode screens
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

    // CAN SIGNALS: properties for CAN signals. Signals will be dynamically received and defined in other screens
    property int canTyrePressure: 0
    property int canABSMalfunction: 0
    property int canTPMS: 0
    property int canServiceMode: 0
    property int canFrontCollision: 0

    // POPUP PROPERTIES: All 3 prooperties for the popUpContainer; popUpIndicator, popUpTitle and popUpMessage
    property alias popUpIndicator : pindicator.source
    property alias popUpTitle : ptitle.text
    property alias popUpMessage : pmessage.text

    // FONT LOADER: Loading popup fonts;  Orbitron-Medium for popUpTitle and Futura-Book for popUpMessage
    FontLoader {id: titleFont; source: "font/orbitron-medium.ttf"}
    FontLoader {id: textFont; source: "font/futura-book-bt.ttf"}

    // POPUP IMAGE: Contains Popup Icon with (66x66) dimensions
    Image {
            id: pindicator
            x: 49
            y: 8
            width: 66
            height: 66
            verticalAlignment: parent.verticalCenter
    }
    // POPUP MESSAGES CONTAINER: containes alignment rules for popUpTitle and popUpMessage
    Rectangle {
        id: messages
        // POPUP TITLE
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
        // POPUP MESSAGE
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
    // POPUP STATES: images, titles and messages displayed when a popup is triggered by a CAN Signal
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
    // POPUP TRANSITIONS: Sequential Animation to load current popup. Each popup's opacity is eased in an out for 2 seconds each and paused for 1 second
    transitions: [
        Transition {
            SequentialAnimation {
                NumberAnimation {target: popupContainer; properties: 'opacity'; from: 0.0; to: 1.0; duration: 1500; easing.type: Easing.InOutQuad}
                PauseAnimation {duration: 2000}
                NumberAnimation {target: popupContainer; properties: 'opacity'; from: 1.0; to: 0.0; duration: 1500; easing.type: Easing.InOutQuad}
            }
            // STATE UPDATE SCRIPT: Update the state of the popup once the current state has finished running
            onRunningChanged: {
                if ((canTyrePressure == 1) && (!running)) {state = 'tyrepressure'; canTyrePressure = 0}
                if ((canABSMalfunction == 1) && (!running)) {state = 'absmalfunction'; canABSMalfunction = 0}
                if ((canTPMS == 1) && (!running)) {state = 'tpms'; canTPMS = 0}
                if ((canServiceMode == 1) && (!running)) {state = 'servicemode'; canServiceMode = 0}
                if ((canFrontCollision == 1) && (!running)) {state = 'frontcollision'; canFrontCollision = 0}
            }
        }
    ]

    // SIMULATOR: Triggering Popups using KeyPresses
    focus: true
    Keys.onPressed: {
        switch(event.key){
        case Qt.Key_T: canTyrePressure == 1 ? canTyrePressure = 0 : canTyrePressure = 1
            break;
        case Qt.Key_A: canABSMalfunction == 1 ? canABSMalfunction = 0 : canABSMalfunction = 1
            break;
        case Qt.Key_P: canTPMS == 1 ? canTPMS = 0 : canTPMS = 1
            break;
        case Qt.Key_S: canServiceMode == 1 ? canServiceMode = 0 : canServiceMode = 1
            break;
        case Qt.Key_F: canFrontCollision == 1 ? canFrontCollision = 0 : canFrontCollision = 1
            break;
        }
    }
}
