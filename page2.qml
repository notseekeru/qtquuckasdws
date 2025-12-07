import QtQuick 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr("PAYMENT METHOD")

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
        spacing: 30

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

        Rectangle {
            width: 800
            height: 100
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
                onClicked: {
                    backend.click_payment("CASH")
                    stack.push("qrc:/finish.qml")
                }
            }
        }

        Text {
            text: "OR"
            color: "white"
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: 800
            height: 100
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
                onClicked: {
                    backend.click_payment("CASHLESS")
                    stack.push("qrc:/finish.qml")
                }
            }
        }
    }
}
