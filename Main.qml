import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    // MAIN WINDOW
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr ("TRATTORIA BELLA VITA")
    
    // CODE
    Rectangle {
        width: 250
        height: 1080
        color: "#282e17"
    }

    Column {
        anchors.centerIn: parent
        spacing: 60

        Rectangle {
                width: 250; height: 50
                color: "#77261e"
                radius: 200
                Text {
                    anchors.centerIn: parent
                    text: "START ORDER"
                    color: "white"
                    font.pixelSize: 32
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stack.push("qrc:/page1.qml");
                        backend.click_order("START ORDER");
                    }

                }
            }
        }

    StackView {
    id: stack
    anchors.fill: parent
    }
}
