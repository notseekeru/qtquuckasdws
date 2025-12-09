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
    title: qsTr("MAIN MENU")

    Column {
        anchors.fill: parent

        Repeater {
            model: [
                { text: "MAIN MENU", file: "qrc:/mainmenu.qml" },
                { text: "ANTI PASTI", file: "qrc:/pages/antipasti.qml" },
                { text: "ZUPP", file: "qrc:/pages/zupp.qml" },
                { text: "PIZZE", file: "qrc:/pages/pizze.qml" },
                { text: "PASTA SPECIALE", file: "qrc:/pages/pasta_speciale.qml" },
                { text: "MEAT COURSE", file: "qrc:/pages/meat_course.qml" },
                { text: "TEA", file: "qrc:/pages/tea.qml" },
                { text: "PARFAIT", file: "qrc:/pages/parfait.qml" },
                { text: "FRUIT SHAKES", file: "qrc:/pages/fruit_shakes.qml" },
                { text: "WATER", file: "qrc:/pages/water.qml" },
            ]

            delegate: Rectangle {
                width: 300
                height: 90
                color: "#a2641b"
                border.width: 1
                border.color: "#000000"

                Text {
                    anchors.centerIn: parent
                    text: modelData.text
                    color: "white"
                    font.pixelSize: 32
                    font.family: "Times New Roman"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stack.push(modelData.file)
                    }
                    hoverEnabled: true
                    onEntered: parent.scale = 1.05
                    onExited: parent.scale = 1.0
                }
            }
        }
        Rectangle {
            width : 300
            height : 900
            color: "#a2641b"
            border.width: 1
            border.color: "#000000"

            MouseArea {
                anchors.fill: parent
                onClicked: stack.push("qrc:/addorder.qml")
            }
        }
    }

    Column {
        Repeater {
            model: [
                { text: "MAIN MENU", file: "qrc:/mainmenu.qml", image: "qrc:/assets/foods/Mainmenu.png" },
                { text: "ANTI PASTI", file: "qrc:/pages/antipasti.qml", image: "qrc:/assets/foods/Carpaccio di Manzo.png" },
                { text: "ZUPP", file: "qrc:/pages/zupp.qml", image: "qrc:/assets/foods/Crema di Zucca.png" },
                { text: "PIZZE", file: "qrc:/pages/pizze.qml", image: "qrc:/assets/foods/Margherita.png" },
                { text: "PASTA SPECIALE", file: "qrc:/pages/pasta_speciale.qml", image: "qrc:/assets/foods/FETTUCINE.png" },
                { text: "MEAT COURSE", file: "qrc:/pages/meat_course.qml", image: "qrc:/assets/foods/Costolette di Maiale.png" },
                { text: "TEA", file: "qrc:/pages/tea.qml", image: "qrc:/assets/foods/Butterfly pea and lemon tea.png" },
                { text: "PARFAIT", file: "qrc:/pages/parfait.qml", image: "qrc:/assets/foods/Classic Mocha Parfait.png" },
                { text: "FRUIT SHAKES", file: "qrc:/pages/fruit_shakes.qml", image: "qrc:/assets/foods/Mango.png" },
                { text: "WATER", file: "qrc:/pages/water.qml", image: "qrc:/assets/foods/San Pellegrino.png" },
            ]
            delegate: Rectangle {
                width: 50
                height: 50
                color: "transparent"

                Image {
                    anchors.fill: parent
                    source: modelData.image
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stack.push(modelData.file)
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
            leftMargin: 40
        }
        Rectangle {
            width: 100
            height: 100
            color: "transparent"
            Text {
                anchors.centerIn: parent
                text: "Total PHP: "
                color: "white"
                font.pixelSize: 32
                font.family: "Times New Roman"
            }
        }
        
    }

    Row {
        spacing: 20
        anchors {
            bottom: parent.bottom
            bottomMargin: 30
            left: parent.left
            leftMargin: 20
        }

        Rectangle {
            width: 150
            height: 50
            color: "#000000"
            Text {
                anchors.centerIn: parent
                text: "Cancel Order"
                color: "white"
                font.pixelSize: 18
                font.family: "Times New Roman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stack.pop()
                }
            }   
        }
        Rectangle {
            width: 200
            height: 50
            color: "#ffffff"
            Text {
                anchors.centerIn: parent
                text: "Proceed to Checkout"
                color: "black"
                font.pixelSize: 18
                font.family: "Times New Roman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stack.push("qrc:/checkout.qml")
                }
            }   
        }
    }
}
