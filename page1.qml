import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    width: 1080
    height: 1080
    color: "#413f36"
    visible: true
    title: qsTr ("ORDER METHOD")

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
        anchors.centerIn: parent
        spacing: 30
    
        Text {
        color: "white"
        font.pixelSize: 48
        text: "WHERE WOULD YOU"
        anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
        color: "white"
        font.pixelSize: 48
        text: "LIKE TO EAT?"
        anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            spacing: 50
            Rectangle {
                width: 400; height: 100
                color: "#815017"
                Text {
                    anchors.centerIn: parent
                    text: "Dine-in"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 32
                    }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        backend.click_order("DINE IN");
                        stack.push("qrc:/page2.qml");
                        }
                    }
                }

            Rectangle {
                width: 400; height: 100
                color: "#815017"
                Text {
                    anchors.centerIn: parent
                    text: "Take-out"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 32
                    }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        backend.click_order("TAKE OUT");
                        stack.push("qrc:/page2.qml");
                        }
                    }       
                }  
            }
            
    }
}