import QtQuick 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr("FINISH")

    Column {
        Text {
        text:"PREPARING YOUR ORDER."
        color: "white"
        font.pixelSize: 48
        anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
        text: "PLEASE HAVE A SEAT."
        color: "white"
        font.pixelSize: 48
        anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
