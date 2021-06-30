import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Harun Mohamed")

    Image {
        id: harun
        source: "https://media-exp3.licdn.com/dms/image/C4E03AQEE0h89D0cyKg/profile-displayphoto-shrink_400_400/0/1604064879101?e=1630540800&v=beta&t=AXBcJRAEqeTzOtURkn-94wHPrV-YP9oFDlkpN85ka0w"
        anchors.centerIn: parent

        Rectangle{
            color: 'green'
            width: parent.width
            height: parent.height
            opacity: 0.2
        }
    }

}
