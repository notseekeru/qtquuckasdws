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
    title: qsTr("FINISH")

    Text {
        anchors {
            top: parent.top
            topMargin: 60
            left: parent.left
            leftMargin: 100
        }
        text: "REVIEW MY ORDER"
        color: "white"
        font.pixelSize: 48
        font.family: "Times New Roman"
    }

    Column {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        width: 250
        height: 50
        color: "#a3641c"
        radius: 500
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 180
        }
        Text {
            anchors.centerIn: parent
            text: "COMPLETE ORDER"
            color: "white"
            font.pixelSize: 22
            font.family: "Times New Roman"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                stack.push("qrc:/page2.qml")
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

    Row {
        spacing: 300

        anchors {
            bottom: parent.bottom
            bottomMargin: 100
            left: parent.left
            leftMargin: 20
        }

        Rectangle {
            width: 150
            height: 50
            color: "black"
            Text {
                anchors.centerIn: parent
                text: "Back"
                color: "white"
                font.pixelSize : 22
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
            width: 150
            height: 50
            color: "black"
            Text {
                anchors.centerIn: parent
                text: "Cancel Order"
                color: "white"
                font.pixelSize : 22
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
    
}
