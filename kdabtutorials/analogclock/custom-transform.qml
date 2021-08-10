import QtQuick 2.9

Rectangle {
    width: 400; height: 400
    color: 'lightblue'

    Image {
        id: rocket
        source: 'rocket.svg'
        anchors.centerIn: parent
        smooth: true

        RotationAnimation on rotation{
            from: 45; to: 315; duration: 2000
            direction: RotationAnimation.Shortest
        }
    }
}
