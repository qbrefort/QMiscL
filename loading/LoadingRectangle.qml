import QtQuick 2.0

Rectangle {
    width: 100
    height: 100
    color: "#e23f3f"
    border.color: "transparent"
    border.width: 5
    radius: 10

    WhiteRectangle{
        id:rect1
        x:parent.width/3 - width/2
        y:parent.height/2 - height/2
    }

    WhiteRectangle{
        id:rect2
        x:parent.width/2 - width/2
        y:parent.height/2 - height/2
    }
    WhiteRectangle{
        id:rect3
        x:parent.width*2/3 - width/2
        y:parent.height/2 - height/2
    }
    property int dur: 100

    ParallelAnimation{
        running: true
        loops: -1

        ParallelAnimation{
            loops: -1
            PropertyAnimation{
                target: rect1
                property: "state"
                to:"On"
            }
            PropertyAnimation{
                target: rect2
                property: "state"
                to:"On"
            }
            PropertyAnimation{
                target: rect3
                property: "state"
                to:"On"
            }
        }

        SequentialAnimation {
            loops: -1

            PropertyAnimation  {
                target: rect1
                property: "sq"
                to:true
            }
            PauseAnimation {
                duration: dur+200
            }
            PropertyAnimation  {
                target: rect2
                property: "sq"
                to:true
            }
            PauseAnimation {
                duration: dur+200
            }
            PropertyAnimation  {
                target: rect3
                property: "sq"
                to:true
            }
            PauseAnimation {
                duration: dur+200
            }
        }
    }
}
