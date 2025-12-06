import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr("MAIN MENU")

    Column {
        Rectangle {
            width: 400
            height: 100
            color: "#a2641b"
            Text {
                anchors.centerIn: parent
                text: "MAIN MENU"
                color: "white"
                font.pixelSize: 32
                font.family: "Times New Roman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    backend.
                    stack.push("qrc:/")
                }
            }
        }
    }
}