import QtQuick 2.0

Rectangle {

    property alias text: textInput.text
    property int diameter: 8



    border.color: 'green'
    color: 'white'
    radius: diameter / 2
    smooth: true
    clip: true

    TextInput{
        id: textInput
        anchors.fill: parent
        anchors.margins: 2
        text: 'Enter Text ...'
        color: focus ? 'black' : 'gray'
        font.pixelSize: parent.height - 4
    }
}
