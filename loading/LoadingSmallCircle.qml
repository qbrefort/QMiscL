import QtQuick 2.0


Rectangle {
    id:mainRect
    width: 100
    height: 100
    color: "#e23f3f"
    border.color: "transparent"
    border.width: 5
    radius: 10

    Canvas {
            id: canvas
            anchors.fill: parent
            antialiasing: true

            onPaint: {
                var context = canvas.getContext("2d")
                context.path = pathAnim.path
                context.path = pathAnim2.path
                context.path = pathAnim3.path
                context.path = pathAnim4.path
            }
        }

    SmallWhiteCircle{
        id:r1
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5
    }

    SmallWhiteCircle{
        id:r2
        width: r1.width - r1.width/7
        x :mainRect.width *1/2 - width*0.5
        y :mainRect.height *1/3- width*0.5

    }
    SmallWhiteCircle{
        id:r3
        width: r2.width - r2.width/7
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }
    SmallWhiteCircle{
        id:r4
        width: r3.width - r3.width/7
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }






        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 0 }
            PathAnimation {
                id: pathAnim

                duration: 2000
                easing.type: Easing.InOutQuad

                target: r1
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r1.width/2, r1.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *1/3

                    PathArc {
                        x: mainRect.width *1/2 -1; y: mainRect.height *1/3
                        radiusX: mainRect.width/6; radiusY: mainRect.width/6
                        useLargeArc: true
                    }

                    onChanged: canvas.requestPaint()
                }
            }
        }

        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 200 }
            PathAnimation {
                id: pathAnim2

                duration: 1800
                easing.type: Easing.InOutQuad

                target: r2
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r2.width/2, r2.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *1/3

                    PathArc {
                        x: mainRect.width *1/2 -1; y: mainRect.height *1/3
                        radiusX: mainRect.width/6; radiusY: mainRect.width/6
                        useLargeArc: true
                    }

                    onChanged: canvas.requestPaint()
                }
            }
        }

        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 400 }
            PathAnimation {
                id: pathAnim3

                duration: 1600
                easing.type: Easing.InOutQuad

                target: r3
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r3.width/2, r3.height/2)
                path: Path {
                    startX: mainRect.width *1/2 ; startY: mainRect.height *1/3

                    PathArc {
                        x: mainRect.width *1/2 -1; y: mainRect.height *1/3
                        radiusX: mainRect.width/6; radiusY: mainRect.width/6
                        useLargeArc: true
                    }

                    onChanged: canvas.requestPaint()
                }
            }
        }

        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 600 }
            PathAnimation {
                id: pathAnim4

                duration: 1400
                easing.type: Easing.InOutQuad

                target: r4
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r4.width/2, r4.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *1/3

                    PathArc {
                        x: mainRect.width *1/2 -1; y: mainRect.height *1/3
                        radiusX: mainRect.width/6; radiusY: mainRect.width/6
                        useLargeArc: true
                    }

                    onChanged: canvas.requestPaint()
                }
            }
        }

}

