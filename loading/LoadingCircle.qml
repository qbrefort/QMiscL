import QtQuick 2.0


Rectangle {
    width: 100
    height: 100
    color: "#e23f3f"
    border.color: "transparent"
    border.width: 5
    radius: 10

    WhiteCircle{
        id: rWest1
        x:1/3 * parent.width - radius
        y: 1/2 * parent.height - radius
    }

    WhiteCircle{
        id:rEast1
        x:2/3 * parent.width- radius
        y: 1/2 * parent.height- radius
    }

    WhiteCircle{
        id:rNorth1
        x:1/2 * parent.width- radius
        y: 1/3 * parent.height- radius
    }

    WhiteCircle{
        id:rSouth1
        x:1/2 * parent.width- radius
        y: 2/3 * parent.height- radius
    }


    WhiteCircle{
        id: rSouthEast1
        x: rSouth1.x + (rEast1.x - rSouth1.x)/2 + 0.7*radius
        y: rEast1.y + (rSouth1.y - rEast1.y)/2 + 0.7*radius
    }

    WhiteCircle{
        id: rSouthWest1
        x: rWest1.x + (rEast1.x - rSouth1.x)/2 - 0.7*radius
        y: rEast1.y + (rSouth1.y - rEast1.y)/2 + 0.7*radius
    }

    WhiteCircle{
        id: rNorthWest1
        x: rWest1.x + (rEast1.x - rSouth1.x)/2 - 0.7*radius
        y: rNorth1.y + (rSouth1.y - rEast1.y)/2 - 0.7*radius
    }

    WhiteCircle{
        id: rNorthEast1
        x: rSouth1.x + (rEast1.x - rSouth1.x)/2 + 0.7*radius
        y: rNorth1.y + (rSouth1.y - rEast1.y)/2 - 0.7*radius
    }
    property int dur: rWest1.dur/4
    SequentialAnimation{

        running: true
        PropertyAnimation  {
            target: rWest1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rNorthWest1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rNorth1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rNorthEast1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rEast1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rSouthEast1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rSouth1
            property: "sq"
            to:true
            duration: dur
        }
        PropertyAnimation  {
            target: rSouthWest1
            property: "sq"
            to:true
            duration: dur
        }
    }

}

