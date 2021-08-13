import QtQuick 2.9

Text {
    id: label
    x: 24; y: 24

    property int spacePresses: 0
    text: "Space presses " + spacePresses + " times"

    onTextChanged: {console.log('text changed to:', text)}
        focus: true
        Keys.onSpacePressed: { increment() }
        Keys.onEscapePressed: { label.text = ''; console.log('kill function initiated'); }
        function increment () {spacePresses += 1}
}
