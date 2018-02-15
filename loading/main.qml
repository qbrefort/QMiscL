import QtQuick 2.9
import QtQuick.Window 2.2


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Grid{
        width: parent.width - 20
        height: parent.height -20
        anchors.centerIn: parent
        spacing: 10
        LoadingCircle{
            id:loadingCircle
        }
        LoadingSmallCircle{

        }
        LoadingDoubleSmallCircle{

        }

        LoadingRectangle{

        }

        LoadingDoubleCircle{

        }

    }


}
