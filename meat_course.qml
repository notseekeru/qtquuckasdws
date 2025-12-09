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
    title: qsTr("MEAT COURSE")

    Text {
        anchors {
            top: parent.top
            topMargin: 60
            horizontalCenter: parent.horizontalCenter
        }
        text: "MEAT COURSE"
        color: "white"
        font.pixelSize: 48
        font.family: "Times New Roman"
    }

    GridView {
        id: menuGrid
        anchors {
            top: parent.top
            topMargin: 150
            left: parent.left
            leftMargin: 50
            right: parent.right
            rightMargin: 50
            bottom: parent.bottom
            bottomMargin: 180
        }
        cellWidth: 320
        cellHeight: 350
        clip: true

        model: ListModel {
            ListElement { name: "Osso Buco"; price: 650; image: "qrc:/assets/foods/osso_buco.jpg" }
            ListElement { name: "Bistecca Fiorentina"; price: 850; image: "qrc:/assets/foods/bistecca.jpg" }
            ListElement { name: "Saltimbocca"; price: 580; image: "qrc:/assets/foods/saltimbocca.jpg" }
            ListElement { name: "Pollo alla Cacciatora"; price: 480; image: "qrc:/assets/foods/pollo_cacciatora.jpg" }
            ListElement { name: "Vitello Tonnato"; price: 620; image: "qrc:/assets/foods/vitello_tonnato.jpg" }
        }

        delegate: Column {
            spacing: 10
            Rectangle {
                width: 280
                height: 200
                color: "#815017"
                radius: 10
                Image {
                    anchors.fill: parent
                    anchors.margins: 5
                    source: model.image
                    fillMode: Image.PreserveAspectCrop
                }
            }
            Text {
                text: model.name
                color: "white"
                font.pixelSize: 22
                font.family: "Times New Roman"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                text: "PHP " + model.price
                color: "white"
                font.pixelSize: 18
                font.family: "Times New Roman"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle {
                width: 150
                height: 40
                color: "#815017"
                radius: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    anchors.centerIn: parent
                    text: "Add to Order"
                    color: "white"
                    font.pixelSize: 16
                    font.family: "Times New Roman"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stack.push("qrc:/addorder.qml")
                    }
                }
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
        spacing: 20
        anchors {
            bottom: parent.bottom
            bottomMargin: 80
            left: parent.left
            leftMargin: 20
        }

        Rectangle {
            width: 150
            height: 50
            color: "#000000"
            Text {
                anchors.centerIn: parent
                text: "Back"
                color: "white"
                font.pixelSize: 22
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
