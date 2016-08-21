import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    ListView {
        id: listView
        anchors {
            top: parent.top
            bottom: info.top
        }
        width: parent.width
        clip: true
        model: 10
        delegate: Label {
            text: qsTr("Item")+" "+index
        }
        PullToRefresh {
            target: parent
            refreshing: timer.refreshing
            onRefresh: {
                timer.refreshing = true;
                timer.start();
            }
        }
    }

    Label {
        id: info
        anchors.bottom: parent.bottom
        visible: timer.refreshing
        text: qsTr("bibibibib refreshing ....")
    }

    Timer {
        id: timer
        property bool refreshing: false
        interval: 2000
        onTriggered: {
            refreshing = false;
        }
    }
}
