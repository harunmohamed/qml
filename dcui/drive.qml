import QtQuick 2.9

Rectangle {
    width: 1920; height: 720
    color: '#000000'
    id: root
    Loader{id: loader; focus: true}

    //bg image
    Image {
        x: 0
        source: 'bg.png'
        width: root.width;
        y: 114

        // center image

        // bottom left

        // bottom center
        Image {
            id: temp
            x: 900
            y: 532
            width: 120
            source: "temp.png"
            fillMode: Image.PreserveAspectFit
        }
        // bottom right

        Image {
            id: sarj
            x: 31
            y: 552
            source: "sarj.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: timeremaining
            x: 1585
            y: 540
            width: 231
            height: 46
            source: "timeremaining.png"
            fillMode: Image.PreserveAspectFit
        }
    }



    // center: Gunsel Logo
    Rectangle {
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
    }

    Image {
        id: lock
        x: 35
        y: 23
        source: "lock.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: parking
        x: 58
        y: 8
        width: 92
        height: 75
        source: "parking.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: _4am
        x: 135
        y: 26
        width: 94
        height: 39
        source: "4am.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: _105km
        x: 1624
        y: 9
        width: 146
        height: 60
        source: "105km.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: chargecable
        x: 1760
        y: 17
        width: 59
        height: 45
        source: "chargecable.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: frame
        x: 637
        y: 82
        source: "frame.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: carcharging
            x: 194
            y: 148
            width: 260
            height: 153
            source: "carcharging.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: battery
            x: 204
            y: 330
            source: "battery.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: charge
            x: 290
            y: 102
            width: 67
            height: 40
            source: "charge.png"
            fillMode: Image.PreserveAspectFit
        }
    }


}
