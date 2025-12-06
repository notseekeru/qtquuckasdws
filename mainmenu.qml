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
        anchors.fill: parent
        Repeater {
            model: [
                { text: "MAIN MENU", file: "qrc:/mainmenu.qml" },
                { text: "ANTI PASTI", file: "qrc:/antipasti.qml" },
                { text: "ZUPP", file: "qrc:/zupp.qml" },
                { text: "PIZZE", file: "qrc:/pizze.qml" },
                { text: "PASTA SPECIALE", file: "qrc:/pasta_speciale.qml" },
                { text: "MEAT COURSE", file: "qrc:/meat_course.qml" },
                { text: "TEA", file: "qrc:/tea.qml" },
                { text: "PARFAIT", file: "qrc:/parfait.qml" },
                { text: "FRUIT SHAKES", file: "qrc:/fruit_shakes.qml" },
                { text: "WATER", file: "qrc:/water.qml" },
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
                    hoverEnabled: true
                    onClicked: {
                        stack.push(modelData.file)
                    }
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
}