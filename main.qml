import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root

    width: 1366
    height: 768
    visible: true
    title: qsTr("BIOS")
    color: 'black'

    property bool bios_flag: false
    property bool boot_flag: false

    FontLoader { id: mainfont; source: 'font.ttf' }

    Timer {
        id: start_pc_timer
        interval: 2000
        repeat: true
        onTriggered: {
            if (!bios_flag && !boot_flag)
            {
                start_pc_popup.open();
                bios_flag = true;
            }
            else if (!boot_flag)
            {
                start_pc_popup.close();
                bios_flag = false;
                boot_flag = true;
                enter_logo.visible = true;
            }
            else
            {
                enter_logo.visible = false;
                windows_table.visible = true;
                stop();
            }
        }
    }

    Button {
        id: start_pc
        anchors.fill: parent
        background: Rectangle {color: 'black'}
        Text {
            anchors.centerIn: parent
            font.pointSize: 30
            font.family: mainfont.name
            text: 'Click to start PC'
            color: 'white'
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 60
            font.pointSize: 16
            font.family: mainfont.name
            text: 'by Maksim Salnikov'
            color: 'white'
        }
        onReleased: {
            visible = false;
            start_pc_timer.start();
        }
    }

    Popup {
        id: start_pc_popup
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        background: Rectangle {color: 'black'}
        focus: true
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: 'logo.jpg'
            anchors.centerIn: parent
        }
        Text {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 10
            font.pointSize: 16
            font.family: mainfont.name
            color: "white"
            text: 'Press F2 go to BIOS'
        }
        Item {
            focus: true
            Keys.onPressed: {
                if (event.key == Qt.Key_F2) {
                    start_pc_popup.close();
                    parent.focus = false;
                    focus = false;
                    mainbios.visible = true;
                    mainbios.focus = true;
                    start_pc_timer.stop();
                }
            }
        }
    }

    BIOS {
        id: mainbios
        focus: true
        anchors.fill: parent
        visible: false
        onLaunch: {
            visible = false;
            boot_flag = false;
            bios_flag = true;
            start_pc_timer.start();
        }
    }

    Image {
        id: enter_logo
        visible: false
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: 'boot.png'
        anchors.centerIn: parent
    }

    Image {
        id: windows_table
        visible: false
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: 'table.png'
        anchors.centerIn: parent
    }
}