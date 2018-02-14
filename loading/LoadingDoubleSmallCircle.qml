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
                context.path = pathAnim5.path

                context.path = pathAnim21.path
                context.path = pathAnim22.path
                context.path = pathAnim23.path
                context.path = pathAnim24.path
                context.path = pathAnim25.path
            }
        }

    property double percWidth: 0.3

    SmallWhiteCircle{
        id:r1
        width: 3
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5
    }

    SmallWhiteCircle{
        id:r2
        width: r1.width + r1.width * percWidth
        x :mainRect.width *1/2 - width*0.5
        y :mainRect.height *1/3- width*0.5

    }
    SmallWhiteCircle{
        id:r3
        width: r2.width + r2.width *percWidth
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }
    SmallWhiteCircle{
        id:r4
        width: r3.width + r3.width/4
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }

    SmallWhiteCircle{
        id:r5
        width: r4.width + r4.width * percWidth
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }

    SmallWhiteCircle{
        id:r21
        width: 3
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5
    }

    SmallWhiteCircle{
        id:r22
        width: r1.width + r1.width * percWidth
        x :mainRect.width *1/2 - width*0.5
        y :mainRect.height *1/3- width*0.5

    }
    SmallWhiteCircle{
        id:r23
        width: r2.width + r2.width/4
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }
    SmallWhiteCircle{
        id:r24
        width: r3.width + r3.width * percWidth
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }

    SmallWhiteCircle{
        id:r25
        width: r4.width + r4.width * percWidth
        x :mainRect.width *1/2- width*0.5
        y :mainRect.height *1/3- width*0.5

    }



    property int delay: 110
    property double delayCoef: 1.5
    property int totalDuration: 2000


        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 0 }
            PathAnimation {
                id: pathAnim

                duration: totalDuration
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

            PauseAnimation { duration: delayCoef*delay }
            PathAnimation {
                id: pathAnim2

                duration: totalDuration - delayCoef*delay
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

            PauseAnimation { duration: delay*delayCoef }
            PathAnimation {
                id: pathAnim3

                duration: totalDuration - delayCoef*delay
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

            PauseAnimation { duration: delay*2*(delayCoef) }
            PathAnimation {
                id: pathAnim4

                duration: totalDuration - delay*2*(delayCoef)
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

        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 3*delay*delayCoef }
            PathAnimation {
                id: pathAnim5

                duration: totalDuration - 3*delay*delayCoef
                easing.type: Easing.InOutQuad

                target: r5
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r5.width/2, r5.height/2)
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




        //Animation for bottom

        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 0 }
            PathAnimation {
                id: pathAnim21

                duration: totalDuration
                easing.type: Easing.InOutQuad

                target: r21
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r21.width/2, r21.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *2/3

                    PathArc {
                        x: mainRect.width *1/2 +1; y: mainRect.height *2/3
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

            PauseAnimation { duration: 1*delay*delayCoef }
            PathAnimation {
                id: pathAnim22

                duration: totalDuration - 1*delay*delayCoef
                easing.type: Easing.InOutQuad

                target: r22
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r22.width/2, r22.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *2/3

                    PathArc {
                        x: mainRect.width *1/2 +1; y: mainRect.height *2/3
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

            PauseAnimation { duration: 2*delay*delayCoef }
            PathAnimation {
                id: pathAnim23

                duration: totalDuration - 2*delay*delayCoef
                easing.type: Easing.InOutQuad

                target: r23
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r23.width/2, r23.height/2)
                path: Path {
                    startX: mainRect.width *1/2 ; startY: mainRect.height *2/3

                    PathArc {
                        x: mainRect.width *1/2 +1; y: mainRect.height *2/3
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

            PauseAnimation { duration: 3*delay*delayCoef }
            PathAnimation {
                id: pathAnim24

                duration: totalDuration - 3*delay*delayCoef
                easing.type: Easing.InOutQuad

                target: r24
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r24.width/2, r24.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *2/3

                    PathArc {
                        x: mainRect.width *1/2 +1; y: mainRect.height *2/3
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

            PauseAnimation { duration: 4*delay*delayCoef }
            PathAnimation {
                id: pathAnim25

                duration: totalDuration - 4*delay*delayCoef
                easing.type: Easing.InOutQuad

                target: r25
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(r25.width/2, r25.height/2)
                path: Path {
                    startX: mainRect.width *1/2; startY: mainRect.height *2/3

                    PathArc {
                        x: mainRect.width *1/2 +1; y: mainRect.height *2/3
                        radiusX: mainRect.width/6; radiusY: mainRect.width/6
                        useLargeArc: true
                    }

                    onChanged: canvas.requestPaint()
                }
            }
        }

}

