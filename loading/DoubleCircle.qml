import QtQuick 2.7

Rectangle {
    id:whiteCircle
    property int leftX: 0
     width: 11
     height: width
     color: "white"
     radius: width*0.5
     opacity: 1


     states: [
             State {
                 name: "Left"
                 PropertyChanges { target: whiteCircle; x: leftX }
             },
             State {
                 name: "Right"
                 PropertyChanges { target: whiteCircle;  x: leftX + 20 }
             }
         ]
     transitions: Transition {
             PropertyAnimation { properties: "x"; duration: 300; easing.type: Easing.InOutQuad }
         }
}

