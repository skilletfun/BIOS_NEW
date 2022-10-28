import QtQuick 2.12
import QtQuick.Controls 2.12


Popup {
    id: root
    
    focus: true
    anchors.centerIn: parent
    width: 350
    padding: 0
    height: rep.contentHeight + 40
    background: Rectangle { color: '#004B4B' }
    
    property alias model: rep.model

    onOpened: { flag = false; }
    onClosed: { flag = true; mainlist.focus = true; rep.currentIndex = 0;}

    ListView {
        id: rep
        height: contentHeight
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        focus: true
        highlight: highlightpop
        highlightFollowsCurrentItem: true
            
        delegate: Text {
            color: 'white'
            font.family: mainfont.name
            font.pointSize: 14
            text: modelData
        }
        
        Keys.onPressed: {
            if (event.key == Qt.Key_F5) {
                if (rep.currentIndex > 0)
                {
                    var obj = rep.model;
                    obj[rep.currentIndex] = rep.model[rep.currentIndex-1];
                    obj[rep.currentIndex-1] = rep.model[rep.currentIndex];
                    rep.model = obj; 
                }
            }
            if (event.key == Qt.Key_F6) {
                if (rep.currentIndex == 0)
                {
                    var obj = rep.model;
                    obj[rep.currentIndex] = rep.model[rep.currentIndex+1];
                    obj[rep.currentIndex+1] = rep.model[rep.currentIndex];
                    rep.model = obj; 
                }
            }
        }
        
        Keys.onReturnPressed: {
            root.close();
        }
    }

    Component {
        id: highlightpop
        Rectangle {
            width: rep.width+20; height: 26
            color: "#009A9A"; radius: 5
            y: rep.currentItem.y
            Behavior on y {
                SpringAnimation {
                    spring: 3
                    duration: 100
                    damping: 0.2
                }
            }
        }
    }
}