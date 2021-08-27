import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root
    Loader{id: loader; focus: true}
    property bool alert: true


    //bg image
    Image {
        id: bg
        x: 0
        source: 'images/bg.png'
        width: root.width;
        y: 114
    }

    // popup component
    Item {

        Component {
            id: popup

            Image {
                id: breaktime
                source: "images/breaktime.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }


    Rectangle {
        id: toptab
        Image {
            id: lock
            x: 35
            y: 23
            source: "images/lock.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: parking
            x: 58
            y: 8
            width: 92
            height: 75
            source: "images/parking.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: _4am
            x: 135
            y: 26
            width: 94
            height: 39
            source: "images/4am.png"
            fillMode: Image.PreserveAspectFit
        }
        // Gunsel Logo
        Rectangle {
            Image {
                id: logo
                source: 'images/logo.png'
                width: 300
                height: 25
                x: (root.width - logo.width) / 2
                y: 20
            }
        }
        Image {
            id: _105km
            x: 1624
            y: 9
            width: 146
            height: 60
            source: "images/105km.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: chargecable
            x: 1760
            y: 17
            width: 59
            height: 45
            source: "images/chargecable.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: bottomtab
        // bottom left
        Image {
            id: sarj
            x: 29
            y: 656
            source: "images/sarj.png"
            fillMode: Image.PreserveAspectFit
        }
        // bottom center
        Image {
            id: temp
            x: 891
            y: 637
            width: 130
            source: "images/temp.png"
            fillMode: Image.PreserveAspectFit
        }
        // bottom right
        Image {
            id: timeremaining
            x: 1593
            y: 648
            width: 231
            height: 46
            source: "images/timeremaining.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: centertab
        // popup section
        Loader {sourceComponent: popup; x: 112; y: 306;width: 396;height: 90; visible: alert ? true : false ;}
        Image {
            id: frame
            x: 644
            y: 78
            source: "images/frame.png"
            fillMode: Image.PreserveAspectFit

            Image {
                id: carcharging
                x: 194
                y: 148
                width: 260
                height: 153
                source: "images/carcharging.png"
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        loader.source = 'dcui.qml'
                        toptab.visible = false
                        bottomtab.visible = false
                        centertab.visible = false
                        bg.visible = false
                    }
                }
            }

            Image {
                id: battery
                x: 204
                y: 330
                source: "images/battery.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: charge
                x: 290
                y: 102
                width: 67
                height: 40
                source: "images/charge.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
