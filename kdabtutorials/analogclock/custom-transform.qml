import QtQuick 2.9

Item {
    width: 300
    height: 480

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {position: 0.0; color: '#4a4a4a'}
            GradientStop {position: 1.0; color: '#2b2b2b'}
        }
    }

    ListView {
        id: listView
        anchors.fill: detailsDelegate
        model: planets
    }

    ListModel {
        id: planets
        ListElement {name: 'Mercury'; imageSource: 'rocket.svg'; facts: 'fsdagsfgrtgwrasdfgsrfytrwetgsadgrewtgsadg'}
        ListElement {name: 'Venus'; imageSource: 'rocket.svg'; facts: 'fsdagsfgrtgwrasdfgsrfytrwetgsadgrewtgsadg'}
        ListElement {name: 'Earth'; imageSource: 'rocket.svg'; facts: 'fsdagsfgrtgwrasdfgsrfytrwetgsadgrewtgsadg'}
        ListElement {name: 'Mars'; imageSource: 'rocket.svg'; facts: 'fsdagsfgrtgwrasdfgsrfytrwetgsadgrewtgsadg'}
    }

    Component {
        id: detailsDelegate

        Item {
            id: wrapper
            width: listView.width
            height: 30

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: 30
                color: '#333'
                border.color: Qt.lighter(color, 1.2)
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4
                    font.pixelSize: parent.height - 4
                    color: '#fff'
                    text: name
                }
            }

            Rectangle {
                id: image
                width: 26
                height: 26
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 2
                anchors.topMargin: 2
                color: 'black'

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: imageSource
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.state = 'expanded'
            }

            Item {
                id: factsView
                anchors.top: image.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                opacity: 0

                Rectangle {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop {position: 0.0; color: '#fed958'}
                        GradientStop {position: 1.0; color: '#fecc2f'}
                    }
                    border.color: '#000000'
                    border.width: 2

                    Text {
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        wrapMode: Text.WordWrap
                        color: '#1f1f21'
                        font.pixelSize: 12
                        text: facts
                    }
                }
            }

            Rectangle {
                id: closeButton
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 2
                anchors.topMargin: 2
                width: 26
                height: 26
                color: '#157efb'
                border.color: Qt.lighter(color, 1.1)
                opacity: 0

                MouseArea {
                    anchors.fill: parent
                    onClicked: wrapper.state = ''
                }
            }

            states: [
                State {
                    name: 'expanded'
                    PropertyChanges {target: wrapper; height: listView.height}
                    PropertyChanges {target: image; width: listView.width; height: listView.width; anchors.rightMargin: 0; anchors.topMargin: 30}
                    PropertyChanges {target: factsView; opacity: 1}
                    PropertyChanges {target: closeButton; opacity: 1}
                    PropertyChanges {target: wrapper.ListView.view; contentY: wrapper.y; interactive: false}
                }
            ]

            transitions: [
                Transition {
                    NumberAnimation {
                        duration: 200;
                        properties: 'height, width, anchors.rightMargin, anchors.topMargin, opacity, contentY'
                    }
                }
            ]
        }
    }







}
