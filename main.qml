import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("NameTag")
    id:window

    Camera {
        id: camera
    }

    VideoOutput {
        id: video
        anchors.fill: parent
        source: camera
    }
}
