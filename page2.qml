import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr("PAYMENT METHOD")

    Rectangle {
        width: 1080
        height: 100
        color: "#282e17"
        anchors {
        bottom: parent.bottom
        bottomMargin: 60
        }
    }
    Column {

        Text {
            text: "WHERE WOULD YOU LIKE TO"
            color: "white"
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: "PAY?"
            color: "white"
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }

        anchors.centerIn: parent
        spacing: 30
        Rectangle {
            width: 800; height: 100
            color: "#ffffffff"

            Column {
                anchors.centerIn: parent

                Text {
                text: "Pay at the Counter"
                color: "black"
                font.bold: true
                font.pixelSize: 48
                anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                text: "(cash)"
                color: "black"
                font.pixelSize: 22
                anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: backend.click_payment("CASH")
            }
        }

        Text {
            text: "OR"
            color: "white"
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: 800; height: 100
            color: "#ffffffff"

            Column {
                anchors.centerIn: parent

                Text {
                text: "Pay Here"
                color: "black"
                font.bold: true
                font.pixelSize: 48
                anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    text: "cashless"
                    color: "black"
                    font.pixelSize: 22
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: backend.click_payment("CASHLESS")
            }
        }
    }
}

