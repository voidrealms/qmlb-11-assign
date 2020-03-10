import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

import com.company.cat 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Cat {
        id: cat
        name: "kitty"
        onMeow: {
            noticeText.text = "MEOW"
            notice.open()
        }

        onNameChanged: {
            noticeText.text = "Name: " + cat.name
            notice.open()
        }
    }

    Popup {
        id: notice
        width: 200
        height: 50
        anchors.centerIn: parent
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Label {
            id: noticeText
            anchors.centerIn: parent
            text: ""
        }
    }

    Column {
        id: column
        width: 200
        height: 199
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10

        Label {
            id: label
            text: qsTr("Name")
        }

        TextField {
            id: textField
        }

        Button {
            id: button
            text: qsTr("Change")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                cat.name = textField.text
            }
        }

        Button {
            id: btnCall
            text: qsTr("Call")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                cat.call();
            }
        }
    }

}
