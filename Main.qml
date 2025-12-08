import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import QtQuick.Window 2.15
import QtQuick.Particles 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr("TRATTORIA BELLA VITA")

    Rectangle {
        width: 250
        height: 1080
        color: "#282e17"
    }

    Column {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 300
        }
        spacing: 200

        Column {
            Text {
                anchors {
                    right: parent.right
                    rightMargin: 350
                }

                text: "TRATTORIA"
                color: "white"
                font.pixelSize: 68
                font.family: "Times New Roman"
            }
            Text {
                text: "BELLA VITA"
                color: "white"
                font.pixelSize: 122
                font.family: "Times New Roman"
            }
            Text {
                text: "WE SERVE YOU."
                color: "white"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                font.family: "Times New Roman"
            }
        }

        Rectangle {
            width: 500
            height: 100
            color: "#77261e"
            radius: 400
            Text {
                anchors.centerIn: parent
                text: "START ORDER"
                color: "white"
                font.pixelSize: 56
                font.family: "Times New Roman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stack.push("qrc:/page1.qml")
                    backend.click_order("START ORDER")
                }
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
    }
}
