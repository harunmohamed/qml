import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root
    Loader{id: loader; focus: true}
    Rectangle {

        id: centerandbottom
        //background image
        Image {
            x: 0
            source: 'bg.png'
            width: root.width;
            y: 114

            // center image
            Image {
                id: footonbrake
                x: 755
                y: 72
                source: "footonbrake.png"
                fillMode: Image.PreserveAspectFit



                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        loader.source = 'drive.qml'
                        top.visible = false
                        centerandbottom.visible = false

                    }
                }
            }

            // bottom left
            Image {
                id: ready
                x: 38
                y: 567
                source: "ready.png"
                fillMode: Image.PreserveAspectFit
            }

            // bottom center
            Image {
                id: temp
                x: 871
                y: 532
                width: 120
                source: "temp.png"
                fillMode: Image.PreserveAspectFit
            }
            // bottom right
            Image {
                id: distance
                x: 1671
                y: 544
                width: 156
                source: "distance.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // top icons
    Rectangle {
        id: top
        // top left: icons, time
        Rectangle {
            id: topleft
            y: 10
            x: 15
            Row {
                x: 25
                y: 8
                // park signal
                Image {
                    y: 5
                   source: 'parksignal.png'
                   width:40; height: 30
                }
                // cool image
                Image {
                   source: 'cool.png'
                   width:50; height: 40
                }
                // time
                Image {
                    x: 10
                    source: '10am.png'
                    width:100; height: 40
                }
            }
        }

        // center: Gunsel Logo
        Rectangle {
            id: center
            Image {
                id: logo
                source: 'logo.png'
                width: 300
                height: 25
                x: (root.width - logo.width) / 2
                y: 20
            }
        }
        // top right: battery charge and time remaining
        Rectangle {
            id: topright
            Image {
                id: c
                x: 1590
                y: 10
                width: 103
                height: 65
                source: "c.png"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: battery
                    x: 72
                    y: 22
                    width: 162
                    height: 35
                    source: "battery.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Image {
                id: _105km
                x: 1665
                y: 65
                width: 139
                height: 32
                source: "105km.png"
                fillMode: Image.PreserveAspectFit
            }
        }

    }

}
