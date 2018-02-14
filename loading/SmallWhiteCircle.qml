import QtQuick 2.7

Rectangle {
    property alias sq : sq.running
    property int dur: 500
    id:whiteCircle
     width: 11
     height: width
     color: "white"
     radius: width*0.5
     opacity: 1
     SequentialAnimation {
        id:sq
        running: false
        loops: Animation.Infinite
        NumberAnimation { target: whiteCircle; property: "opacity"; from: 0.2; to:1 ;  duration: whiteCircle.dur }
        NumberAnimation { target: whiteCircle; property: "opacity"; from: 1;to: 0.2; duration: whiteCircle.dur }
    }

     states: [
             State {
                 name: "On"
                 PropertyChanges { target: whiteCircle; opacity: 1 }
             },
             State {
                 name: "Off"
                 PropertyChanges { target: whiteCircle; opacity: 0.3 }
             }
         ]
}

