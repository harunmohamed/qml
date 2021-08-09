import QtQuick 2.0

Flickable {
    id: flick
    width: 400; height: 400
    contentWidth: 600
    contentHeight: 600

    PinchArea {
        anchors.fill: parent
        pinch.target: img
        pinch.maximumScale: 1.0
        pinch.minimumScale: 0.1
        pinch.dragAxis: Pinch.XAndYAxis
    }

    Image {
       width: flick.contentWidth
       height: flick.contentHeight
       source: 'wallpaper.jpg'
    }
}
