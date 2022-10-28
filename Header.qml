import QtQuick 2.12
import QtQuick.Controls 2.12


Rectangle {
    width: parent.width
    height: 180
    color: '#000E0E'
    clip: true

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        color: '#000E0E'
        anchors.top: parent.top
        height: 50
    }

    Text {
        color: 'white'
        font.family: mainfont.name
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 15
        font.pointSize: 20
        text: 'UEFI BIOS Utility - Advanced Mode'
    }

    Rectangle {
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        color: '#003636'
        anchors.top: parent.top
        anchors.topMargin: 50
    }

    Row {
        spacing: 10
        anchors.leftMargin: 15
        anchors.topMargin: 70
        anchors.fill: parent
        BIOSButton {
            index: 0
            _text: 'Main'
            _source: 'main.png' 
        }
        BIOSButton {
            index: 1
            _text: 'Advanced'
            _source: 'advsettings.png'
        }
        BIOSButton {
            index: 2
            _text: 'Power'
            _source: 'power.png'
        }
        BIOSButton {
            index: 3
            _text: 'Boot'
            _source: 'iboot.png'
        }
        BIOSButton {
            index: 4
            _text: 'Exit'
            _source: 'exit.png'
        }
    }
}