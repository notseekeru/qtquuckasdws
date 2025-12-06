import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr("ORDER METHOD")

    Rectangle {
        height: 100
        color: "#282e17"
        anchors {
            bottom: parent.bottom
            bottomMargin: 60
            left: parent.left
            right: parent.right
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 50

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Text {
                color: "white"
                font.pixelSize: 32
                text: "WHERE WOULD YOU"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Times New Roman"
            }
            Text {
                color: "white"
                font.pixelSize: 32
                text: "LIKE TO EAT?"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Times New Roman"
            }
        }

        Row {
            spacing: 80
            Column {
                spacing: 20
                Rectangle {
                    width: 300
                    height: 300
                    color: "transparent"
                    Image {
                        anchors.fill: parent
                        source: "qrc:/assets/dinein.png"
                        fillMode: Image.PreserveAspectCrop
                    }
                }
                Rectangle {
                width: 300
                height: 100
                color: "#815017"
                    Text {
                        anchors.centerIn: parent
                        text: "Dine-in"
                        color: "white"
                        font.pixelSize: 32
                        font.family: "Times New Roman"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.click_order("DINE IN")
                            stack.push("qrc:/mainmenu.qml")
                        }
                    }
                }
            }
            
            Column {
                spacing: 20
                Rectangle {
                    width: 300
                    height: 300
                    color: "transparent"
                    Image {
                        anchors.fill: parent
                        source: "qrc:/assets/takeout.png"
                        fillMode: Image.PreserveAspectCrop
                    }
                }

                Rectangle {
                width: 300
                height: 100
                color: "#815017"
                    Text {
                        anchors.centerIn: parent
                        text: "Take-out"
                        color: "white"
                        font.pixelSize: 32
                        font.family: "Times New Roman"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.click_order("TAKE OUT")
                            stack.push("qrc:/mainmenu.qml")
                        }
                    }
                }
            }
        }
    }
}