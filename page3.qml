import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    width: 1080
    height: 1080
    visible: true

    Column {
        anchors.centerIn: parent
        spacing: 60
        Row {
            spacing: 30
            Rectangle {
                width: 250; height: 100
                color: "#f1c40f"
                radius: 12

                Text {
                    anchors.centerIn: parent
                    text: "CASH"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 48
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.click_payment("CASH")
                }
            }
            Rectangle {
                width: 250; height: 100
                color: "#68db0a"
                radius: 12

                Text {
                    anchors.centerIn: parent
                    text: "CASHLESS"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 48
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.click_payment("CASHLESS")
                }
            }
        }
    }
}
