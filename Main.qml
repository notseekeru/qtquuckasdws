import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    // MAIN WINDOW
    width: 1080
    height: 1080
    visible: true
    title: qsTr ("TRATTORIA BELLA VITA")

    // CODE

    Column {
        anchors.centerIn: parent
        spacing: 60

        Rectangle {
                width: 250; height: 100
                color: "#f1c40f"
                radius: 20
                Text {
                    anchors.centerIn: parent
                    text: "START ORDER"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 48
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        loader.push("qrc:/page1.qml")
                        backend.click_order("START ORDER")
                    }

                }
            }

    }
}
