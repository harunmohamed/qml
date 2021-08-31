import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 400
    height: 100

    RowLayout {
        anchors.centerIn: parent
        Button {
            text: "systray message"
            onClicked: {
                systray.showMessage("title", "message", SystemTrayIcon.Warning, 2000)
            }
        }
        Button {
            text: "custom message"
            onClicked: {
                popup.show();
            }
        }
    }

    SystemTrayIcon {
        id: systray
          visible: true
          icon.source: "qrc:/ok.png"
          icon.mask: false
    }

    Window {
        id: popup
        flags: Qt.FramelessWindowHint
        x: Screen.width - 350
        y: Screen.height - 150
        width: 300
        height: 30
        Rectangle {
            anchors.fill: parent
            color: "black"
            Text {
                anchors.centerIn: parent
                text: "Some custom message"
                color: "white"
            }
        }
        Timer {
            id: timer
            interval: 2000;
            running: false;
            repeat: false
            onTriggered: popup.close()
        }
        onVisibleChanged: {
            if(visible)
                timer.running = true;
        }
    }
}
