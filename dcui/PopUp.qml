import QtQuick 2.9

// POPUP CONTAINER: contains the whole popup component to be imported to other screens.
// Predefined positioning for the eco and cool mode screens. define x = 135 and y = 320 for the wake up screen and mouflon mode screens
Rectangle {
    id: popupContainer
    border.color: state == '' ? 'transparent' : '#cccccc'
    implicitWidth: 423
    implicitHeight: 82
    x: 749
    y: 498
    color: 'transparent'
    border.width: 2
    radius: 20

    // CAN SIGNALS: properties for CAN signals. Signals will be dynamically received and defined in other screens
    property int canTyrePressure: 1
    property int canABSMalfunction: 1
    property int canTPMS: 0
    property int canServiceMode: 0
    property int canFrontCollision: 1

    // POPUP PROPERTIES: All 3 properties for the popUpContainer; popUpIndicator, popUpTitle and popUpMessage
    property alias popUpIndicator : pindicator.source
    property alias popUpTitle : ptitle.text
    property alias popUpMessage : pmessage.text

    // FONT LOADER: Loading popup fonts;  Orbitron-Medium for popUpTitle and Futura-Book for popUpMessage
    FontLoader {id: titleFont; source: "qrc:/motorama/font/orbitron-medium.ttf"}
    FontLoader {id: textFont; source: "qrc:/motorama/font/futura-book-bt.ttf"}

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
        // HYDRAULIC SERVICE BRAKES
        State {
            name: 'lowbrakefluid'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lowbrakefluid.png"; popUpTitle : "Low Brake Fluid"; popUpMessage : "Brake fluid level is low";}
        },
        State {
            name: 'brakepadwear'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/brakefailure.png"; popUpTitle : "Brake Pad Wear"; popUpMessage : "Brake Pad is worn out";}
        },
        State {
            name: 'hsbmalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/brakefailure.png"; popUpTitle : "HSB Malfunction"; popUpMessage : "Hydraulic Service Brakes Malfunction";}
        },
        // ABS
        State {
            name: 'absmalfunction'
            when: canABSMalfunction == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/absmalfunction.png"; popUpTitle : "ABS Malfunction"; popUpMessage : "Anti-Lock Braking System Failure";}
        },
        // ESP
        State {
            name: 'unexpecteddrift'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/unexpecteddrift.png"; popUpTitle : "Unexpected Drift"; popUpMessage : "Take over steering!";}
        },
        State {
            name: 'espoff'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/espoff.png"; popUpTitle : "ESP Off Warning"; popUpMessage : "Electronic Stability Program Off";}
        },
        State {
            name: 'espmalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/espmalfunction.png"; popUpTitle : "ESP Malfunction"; popUpMessage : "Electronic Stability Program Malfunction";}
        },
        // DRIVER & PASSENGER FRONT AIRBAGS, INCLUDES MANUAL PASSENFER AIRBAG DEACTIVATION FUNCTION
        State {
            name: 'defectiveairbag'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/defectiveairbag.png"; popUpTitle : "Defective Airbag"; popUpMessage : "One or more airbags is defective";}
        },
        // THREE-POINT RETRACTABLE SEAT BELT WARNINGS
        State {
            name: 'fastenfrontbelt'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/fastenseatbelt.png"; popUpTitle : "Fasten Front Belt"; popUpMessage : "Fasten front seat belt";}
        },
        State {
            name: 'fastenrearbelt'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/fastenseatbelt.png"; popUpTitle : "Fasten Rear Belt"; popUpMessage : "Rear Passengers should fasten seatbelts";}
        },
        // TYRE PRESSURE MONITORING SYSTEM
        State {
            name: 'tyrepressure'
            when: canTyrePressure == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/tyre.png"; popUpTitle : "Adjust Tyre Pressure"; popUpMessage : "Tyre pressure is below safe levels";}
        },
        State {
            name: 'tpms'
            when: canTPMS == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/tyre.png"; popUpTitle : "TPMS Malfunction"; popUpMessage : "Tyre Pressure Monitoring System Malfunction";}
        },
        // LOW VOLTAGE BATTERY LIFETIME & BATTERY WARNINGS
        State {
            name: 'lowsoh'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lowsoh.png"; popUpTitle : "Low State of Health"; popUpMessage : "Low voltage battery health below 40%";}
        },
        State {
            name: 'lowsoc'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lowsoc.png"; popUpTitle : "Low State of Charge"; popUpMessage : "Optimal Battery Capacity is below 40%";}
        },
        State {
            name: 'notcharging'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/notcharging.png"; popUpTitle : "Battery Not Charging"; popUpMessage : "Discharge current is higher than battery voltage";}
        },
        // HV INTERLOCK
        State {
            name: 'servicemode'
            when: canServiceMode == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/service.png"; popUpTitle : "Service Mode Active"; popUpMessage : "Service mode has been activated";}
        },
        // ADVANCED EMERGENCY BRAKING SYSTEM & FRONT COLLISION WARNING
        State {
            name: 'frontcollision'
            when: canFrontCollision == 1
            PropertyChanges{target: popupContainer; popUpIndicator: "images/frontcollision.png"; popUpTitle : "Front Collision Warning"; popUpMessage : "Front Collision Imminent: Slow Down";}
        },
        State {
            name: 'aebmalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/brakefailure.png"; popUpTitle : "AEB Malfunction"; popUpMessage : "Autonomous Braking System Malfunction";}
        },
        // LANE DEPARTURE WARNING & EMERGENCY LANE KEEPING ASSIST SYSTEM
        State {
            name: 'rightlanedeparture'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lanedeparture.png"; popUpTitle : "Right Lane Departure"; popUpMessage : "Right lane departure without indicating";}
        },
        State {
            name: 'leftlanedeparture'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lanedeparture.png"; popUpTitle : "Left Lane Departure"; popUpMessage : "Left lane departure without indicating";}
        },
        State {
            name: 'laneassistsystemfailure'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lanedeparture.png"; popUpTitle : "Lane Assist System Failure"; popUpMessage : "Lane Assist System has been deactivated";}
        },
        // DRIVER DROWSINESS & ATENTION SYSTEM
        State {
            name: 'ddactivation'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/ddactivation.png"; popUpTitle : "Drowsiness Detection Activated"; popUpMessage : "Attention Assist: Take a break";}
        },
        State {
            name: 'ddmalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/ddmalfunction.png"; popUpTitle : "Drowsiness Detection Malfunction"; popUpMessage : "Driver Drowsiness Detection System Failure";}
        },
        // PASSIVE ENTRY
        State {
            name: 'keyfobundetected'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/keyfoberror.png"; popUpTitle : "Key Fob Not Detected"; popUpMessage : "Key Fob is outside detection radius";}
        },
        State {
            name: 'keyfobleft'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/keyfoberror.png"; popUpTitle : "Key Fob Left"; popUpMessage : "Key Fob left inside the vehicle";}
        },
        State {
            name: 'unauthorizedkeyfob'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/keyfoberror.png"; popUpTitle : "Unauthorized Key Fob"; popUpMessage : "Key Fob not authorized to initiate ignition";}
        },
        State {
            name: 'lowbatterykeyfob'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/keyfoberror.png"; popUpTitle : "Low Key Fob Battery"; popUpMessage : "Key Fob battery is low";}
        },
        // SPEED SENSITIVE ELECTRIC POWER STEERING
        State {
            name: 'epsmalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/epsmalfunction.png"; popUpTitle : "EPS Malfunction"; popUpMessage : "Low Steering Fluid Level";}
        },
        // DRIVING MODES
        State {
            name: 'fullthrottlewarning'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/fullthrottlewarning.png"; popUpTitle : "Full Throttle Warning"; popUpMessage : "Relax your foot from the accelerator";}
        },
        // GUNSEL SMOOTH DRIVE
        State {
            name: 'lowpoweroroverheating'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lowpoweroroverheating.png"; popUpTitle : "Low Power/Overheating"; popUpMessage : "Vehicle has low power or is overheating";}
        },
        // INTELLIGENT SPEED ASSISTANCE
        State {
            name: 'isamalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lanedeparture.png"; popUpTitle : "ISA Malfunction"; popUpMessage : "Intelligent Speed Assistance Malfunction";}
        },
        // ELECTRIC PARKING ASSISTANCE
        State {
            name: 'epbmalfunction'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/epbmalfunction.png"; popUpTitle : "EPB Malfunction"; popUpMessage : "Electric Park Brake Malfunction";}
        },
        // ON/OFF-BOARD DIAGNOSTICS CAPABILITY
        State {
            name: 'periodicservicereminder'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/service.png"; popUpTitle : "Periodic Service Reminder"; popUpMessage : "Reminder to service vehicle after 5000KM run";}
        },
        // GUNSEL THERMAL MAANGEMENT SYSTEM
        State {
            name: 'coolantlevelwarning'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/coolanttemperaturewarning.png"; popUpTitle : "Coolant Level Warning"; popUpMessage : "Coolant fluid is low";}
        },
        State {
            name: 'coolanttemperaturewarning'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/coolanttemperaturewarning.png"; popUpTitle : "Coolant Temeprature Warning"; popUpMessage : "Coolant Temperature is above safe levels";}
        },
        State {
            name: 'batteryhightemp'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/lowpoweroroverheating.png"; popUpTitle : "Battery High Temperature"; popUpMessage : "Battery temperature is above safe levels";}
        },
        State {
            name: 'batterylowtemp'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/batterylowtemp.png"; popUpTitle : "Battery Low Temperature"; popUpMessage : "Battery Temperature is below safe levels";}
        },
        // 11Kw ON-BOARD CHARGER WITH CCS2 DC FAST CHARGING INTERFACE
        State {
            name: 'chargeinterruption'
            PropertyChanges{target: popupContainer; popUpIndicator: "images/chargeinterruption.png"; popUpTitle : "Charge Interruption"; popUpMessage : "Charging has encountered a fault";}
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
