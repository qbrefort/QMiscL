import QtQuick 2.0

Rectangle {
    property alias sq : sq.running
    property int dur: 300
    id:whiteRect
    width: 10
    height: 20
    color: "white"
    border.color: "transparent"
    border.width: 3
    radius: 3
    state: "Off"

    Behavior on opacity {
        NumberAnimation { duration: 3000 ; easing.type : Easing.InQuad}
    }
    SequentialAnimation {
       id:sq
       running: false
       loops: Animation.Infinite
       NumberAnimation { target: whiteRect; property: "height"; from: 20; to: 50; duration: whiteRect.dur ; easing.type: Easing.InOutQuad }
       NumberAnimation { target: whiteRect; property: "height"; from: 50; to: 20; duration: whiteRect.dur; easing.type: Easing.InOutQuad  }
   }

    states: [
            State {
                name: "On"
                PropertyChanges { target: whiteRect; opacity: 1 }
            },
            State {
                name: "Off"
                PropertyChanges { target: whiteRect; opacity: 0 }
            }
        ]
}
