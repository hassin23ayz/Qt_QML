import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 400
    height: 400
    visible: true
    color: "#1c9c67"
    visibility: Window.Windowed
    modality: Qt.WindowModal
    title: qsTr("UniversaPulsar")

    Label{
        id: label
        text: qsTr("Innovation for sustainability")
        anchors.centerIn: parent
    }

    Button {
        id: button
        x: 270
        y: 165
        text: qsTr("Button")
        onClicked: {
            label.text = textField.text
        }
    }

    Label {
        id: label2
        x: 302
        y: 258
        text: qsTr("Label")
    }

    TextField {
        id: textField
        x: 221
        y: 57
        placeholderText: qsTr("Text Field")
    }
}


