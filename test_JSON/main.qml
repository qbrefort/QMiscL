import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQml.Models 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ListView {
        id: mainList
        width: 150; height: 300
        anchors.centerIn: parent
        model: myModel
        spacing: 10
        delegate: Rectangle {
            height: 50
            width: 150
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if(rectInfo.state === "on")
                    {
                        rectInfo.state = "off";
                        changeDesc.state = "off";
                    }
                    else
                        rectInfo.state ="on";
                }
            }
            Rectangle{
                id : mainRect
                color:"#2a6bdd"
                border.width: 2
                border.color: "grey"
                height: parent.height
                width: parent.width
                Text {
                    id: text
                    anchors.centerIn: parent
                    color: "white"
                    text: modelData.name
                }
            }
            Rectangle{
                id:rectInfo
                height: mainRect.height
                width: 0
                anchors.top: mainRect.top
                anchors.left:mainRect.right
                color:"lightblue"
                opacity: 1
                state: "off"

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(changeDesc.state === "on")
                            changeDesc.state = "off";
                        else
                            changeDesc.state ="on";
                    }
                }

                Text {
                    id: textInfo
                    anchors.centerIn: parent
                    color: "black"
                    text: modelData.desc

                }

                TextField{
                    id: changeDesc
                    anchors.centerIn: parent
                    height: parent.height
                    width: parent.width
                    opacity: 0
                    placeholderText: qsTr("Enter new description")
                    state:"off"

                    onAccepted: {
                        modelData.desc = changeDesc.text;
                        state = "off";
                    }
                    transitions: Transition {
                            NumberAnimation { properties: "width"; easing.type: Easing.OutQuad; duration: 500 }
                            NumberAnimation { properties: "opacity"; easing.type: Easing.OutQuad; duration: 300 }
                        }
                    states: [
                            State {
                                name: "on"
                                PropertyChanges { target: changeDesc; width: mainRect.width }
                                PropertyChanges { target: changeDesc; opacity: 1 }
                            },
                            State {
                                name: "off"
                                PropertyChanges { target: changeDesc; width: 0 }
                                PropertyChanges { target: changeDesc; opacity: 0 }
                            }
                        ]
                }

                transitions: Transition {
                        NumberAnimation { properties: "width"; easing.type: Easing.OutQuad; duration: 500 }
                        NumberAnimation { properties: "opacity"; easing.type: Easing.OutQuad; duration: 300 }
                    }
                states: [
                        State {
                            name: "on"
                            PropertyChanges { target: rectInfo; width: mainRect.width }
                            PropertyChanges { target: textInfo; opacity: 1 }
                        },
                        State {
                            name: "off"
                            PropertyChanges { target: rectInfo; width: 0 }
                            PropertyChanges { target: textInfo; opacity: 0 }
                        }
                    ]
            }
        }
    }
}
