import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import QtQuick.Window 2.15
import QtQuick.Particles 2.15

Window {
    width: 1080
    height: 1080
    color: "#423f36"
    visible: true
    title: qsTr("ADD TO ORDER")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Row {
            spacing: 40
            Text {
                text: "Quantity"
                color: "white"
                font.pixelSize: 24
                font.family: "Times New Roman"
            }
            Row {
                Rectangle {
                    width: 100
                    height: 50
                    color: "white"
                    border.width: 1
                    border.color: "black"

                    Text {
                        anchors.centerIn: parent
                        text: "-"
                        color: "black"
                        font.pixelSize: 24
                        font.family: "Times New Roman"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("addtoorder -")
                        }
                    }
                }
                Rectangle {
                    width: 100
                    height: 50
                    color: "white"
                    border.width: 1
                    border.color: "black"

                    Text {
                        anchors.centerIn: parent
                        text: "+"
                        color: "black"
                        font.pixelSize: 24
                        font.family: "Times New Roman"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("addtoorder +")
                        }
                    }
                }
            }
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 100
            color: "#815017"
            radius: 500
            Text {
                anchors.centerIn: parent
                text: "ADD TO ORDER"
                color: "white"
                font.pixelSize: 32
                font.family: "Times New Roman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stack.pop()
                }
            }
        }
        Rectangle {
            width: 1
            height: 200
            color: "#413f36"
        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 50
            color: "#802920"
            radius: 500
            Text {
                anchors.centerIn: parent
                text: "CANCEL ORDER"
                color: "white"
                font.pixelSize: 22
                font.family: "Times New Roman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stack.pop()
                }
            }
        }
    }
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
}
