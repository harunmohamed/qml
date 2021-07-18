import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    color: 'black'
    title: qsTr("Gunsel Software Engineering Internship Assessment by Harun Mohamed")

    Image {
        id: harun
        source: "https://gitlab.gunsel.com.tr/gunsel-public/embedded-app-career-task-1/raw/master/GunselBmsCheckupUi.png"
        anchors.centerIn: parent

        //current
         Text {
             id: current
             text: qsTr("16")
             font.pixelSize: 20
             color: '#05a96d'
             x: 32
             y: 90
             width: 0
             height: 30
             focus: true
             Keys.onPressed: {
                 if (event.key === Qt.Key_Q) {
                     console.log("current increased by 2");
                 } else if (event.key === Qt.Key_A){
                    console.log("current decreased by 2");
                 }
             }
         }
         //voltage
          Text {
              id: voltage
              text: qsTr("350")
              font.pixelSize: 20
              color: '#05a96d'
              x: 102
              y: 90
              width: 30
              height: 30
              focus: true
              Keys.onPressed: {
                  if (event.key === Qt.Key_W) {
                      console.log("voltage increased by 5");
                  } else if (event.key === Qt.Key_S){
                      console.log("voltage decreased by 5");
                   }
              }
          }
          //capacity
           Text {
               id: capacity
               text: qsTr("74")
               font.pixelSize: 20
               color: '#05a96d'
               x: 173
               y: 90
               width: 30
               height: 30
               focus: true
               Keys.onPressed: {
                   if (event.key === Qt.Key_E) {
                       console.log("capacity increased by 8");
                   } else if (event.key === Qt.Key_D){
                       console.log("capacity decreased by 8");
                    }
               }
           }
           //temp1
            Text {
                id: temp1
                text: qsTr("20")
                font.pixelSize: 20
                color: '#05a96d'
                x: 244
                y: 90
                width: 30
                height: 30
                focus: true
                Keys.onPressed: {
                    if (event.key === Qt.Key_R) {
                        console.log("temp1 increased by 1");
                    } else if (event.key === Qt.Key_F){
                        console.log("temp1 decreased by 1");
                     }
                }
            }
            //temp2
             Text {
                 id: temp2
                 text: qsTr("22")
                 font.pixelSize: 20
                 color: '#05a96d'
                 x: 316
                 y: 90
                 width: 30
                 height: 30
                 focus: true
                 Keys.onPressed: {
                     if (event.key === Qt.Key_T) {
                         console.log("temp2 increased by  1");
                     } else if (event.key === Qt.Key_A){
                         console.log("temp2 decreased by  1");
                      }
                 }
             }
             //balance
              Text {
                  id: balance
                  text: qsTr("4")
                  font.pixelSize: 20
                  color: '#05a96d'
                  x: 390
                  y: 90
                  width: 30
                  height: 30
              }
    }

}
