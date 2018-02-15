import QtQuick 2.0


Rectangle {
    id:mainRect
    width: 100
    height: 100
    color: "#e23f3f"
    border.color: "transparent"
    border.width: 5
    radius: 10

    DoubleCircle{
        id:r1
        width: 10
        x :mainRect.width *1/3- width*0. -20
        leftX: mainRect.width *1/2 - width*0.5 -20
        y :mainRect.height *1/2- width*0.5
        state: "Left"
    }

    DoubleCircle{
        id:r2
        width: 10
        x :mainRect.width *1/2 - width*0.5 -20
        y :mainRect.height *1/2- width*0.5
        leftX:mainRect.width *2/3 - width*0.5 - 20
        state: "Right"
    }

    ParallelAnimation{
        running: true
        loops: Animation.Infinite

        SequentialAnimation{
            PropertyAnimation  {
                target: r1
                property: "state"
                to:"Right"
            }
            PauseAnimation {
                duration: 300
            }
            PropertyAnimation  {
                target: r1
                property: "state"
                to:"Left"
            }
            PauseAnimation {
                duration: 300
            }
        }

        SequentialAnimation{
            PropertyAnimation  {
                target: r2
                property: "state"
                to:"Left"
            }
            PauseAnimation {
                duration: 300
            }
            PropertyAnimation  {
                target: r2
                property: "state"
                to:"Right"
            }
            PauseAnimation {
                duration: 300
            }
        }

    }
}


