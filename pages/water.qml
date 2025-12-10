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
    title: qsTr("WATER")

    property real orderTotal: 0

    Connections {
        target: orderManager
        function onOrderChanged() {
            orderTotal = orderManager.getOrderTotal()
        }
    }

    Component.onCompleted: {
        orderTotal = orderManager.getOrderTotal()
    }

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
        width: 500
        height: parent.height
        spacing: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 350

        Repeater {
            model: orderManager.getMenuItemsByCategory("water")

            delegate: Rectangle {
                width: 700
                height: 120
                color: "transparent"

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 15

                    Image {
                        width: 100
                        height: 100
                        source: modelData.image
                        fillMode: Image.PreserveAspectFit
                    }

                    Column {
                        width: parent.width - 130
                        height: parent.height
                        spacing: 5

                        Text {
                            text: modelData.name
                            color: "white"
                            font.pixelSize: 24
                            font.bold: true
                            font.family: "Times New Roman"
                        }

                        Text {
                            text: "₱" + modelData.price.toFixed(2)
                            color: "#ffeb3b"
                            font.pixelSize: 20
                            font.family: "Times New Roman"
                        }

                        Rectangle {
                            width: 120
                            height: 35
                            color: "#4caf50"
                            radius: 5

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
                                    orderManager.addToOrder(modelData.id)
                                }
                            }
                        }
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
                text: "Total PHP: " + orderTotal.toFixed(2)
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
                    orderManager.clearOrder()
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
