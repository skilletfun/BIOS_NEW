import QtQuick 2.12
import QtQuick.Controls 2.12


Button {
    id: root
    
    property int index: 0
    property string _text: '' 
    property alias _source: icon.source

    height: 100
    width: 200
    
    background: Rectangle { color: root.index == current_tab ? '#0E6C6C' : '#002929'; radius: 15 }
    
    contentItem: Item {
        width: root.width
        height: root.height
        Image {
            id: icon
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            height: 50
            width: height
            fillMode: Image.PreserveAspectFit
        }
        Text {
            width: parent.width
            text: root._text
            horizontalAlignment: Text.AlignHCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            font.family: mainfont.name
            font.pointSize: 12
            color: 'white'
        }
    }

    onClicked: {
        current_tab = index;
    }
}