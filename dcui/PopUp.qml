import QtQuick 2.9

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
    FontLoader {id: textFont; source: "font/orbitron-light.ttf"}

    // properties
    property alias popUpIndicator : pindicator.source
    property alias popUpTitle : ptitle.text
    property alias popUpMessage : pmessage.text


    Image {
            id: pindicator
            x: 49
            y: 8
            width: 66
            height: 66
            verticalAlignment: parent.verticalCenter
    }
    Rectangle {
        id: messages
        Text {
            id: ptitle
            y: 15
            color: '#cccccc'
            font.family: titleFont.name
            font.capitalization: Font.AllUppercase
            font.pixelSize: 18
            anchors.leftMargin: 125
            anchors.left: messages.left
        }
        Text {
            id: pmessage
            y: 40
            color: '#cccccc'
            font.family: textFont.name
            font.pixelSize: 22
            anchors.leftMargin: 125
            anchors.left: messages.left
        }

     }

    PropertyAnimation {id: showPopUp; target: popupContainer; property: opacity; to: 1; duration: 500; easing.type: Easing.linear}


}
