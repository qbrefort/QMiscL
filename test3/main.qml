import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

import test3.backend 1.0
import test3.demodata 1.0
Window {
    objectName: "myWindow"
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    BackEnd {
        id: backend
    }

    DemoData{
        id:demodata
    }

    TextField {
           id:myText
           text: backend.userName
           placeholderText: qsTr("User name")
           anchors.centerIn: parent

           onTextChanged: backend.userName = text
       }
    Button {
        id: mButton
        anchors.top: myText.bottom
        anchors.left : myText.left
        onClicked: {
            backend.setUserName(myText.text+"a");
        }
    }

        Timer {
                interval: 500; running: true; repeat: true
                onTriggered: numberTxtField.text = backend.myData
        }
        Text{

            objectName: "numberTxtField"
            id:numberTxtField
            anchors.left: myText.left
            anchors.top: mButton.bottom

    }
}
