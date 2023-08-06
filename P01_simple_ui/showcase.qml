// showcase.qml                            // QML is a markup language , composed of tags / also called types in QtQuick

import QtQuick 2.5                         // standard types are located in QtQuick
import QtGraphicalEffects 1.0

Image {                                    // Image is a type
    id: root                               // a QML document can have only one root
                                           // root is the top most predictable in large QML document
                                           // id is a property , can be used as a reference elsewhere , cannot be set at runtime
    source: "images/background.png"        // each types has properties such as id , source, width, height

    property int blurRadius: 0
                                           // The foreground images: pole, wheel are included as separate images
    Image {
        id: pole
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom      // Anchoring allows you to specify geometric relations between parent and sibling objects
        source: "images/pole.png"
    }
                                           // placing an image as a child type of our root type (the Image) illustrates an important
                                           // concept, topmost layer is drawn first and then the child layers
    Image {
        id: wheel
        anchors.centerIn: parent
        source: "images/pinwheel.png"
        Behavior on rotation {             // Behavior specifies an animation for a defined property for every change applied to that property
            NumberAnimation {              // An animation defines how a property change occurs over a period of time
                duration: 250              // whenever wheel's rotation changes , it will be animated with a duration of 250ms
            }
        }
        layer.effect: FastBlur {
            id: blur
            radius: root.blurRadius
            Behavior on radius {
                NumberAnimation {
                    duration: 250
                }
            }
        }
        layer.enabled: true
    }
                                           // the mouse area emits signals
    MouseArea {
        anchors.fill: parent
        onPressed: {                       // you can connect to this signal by overriding the callback functions
            wheel.rotation += 90           // other element's variable is accessed
            root.blurRadius = 16           // root element's variable is accessed
        }
        onReleased: {
            root.blurRadius = 0
        }
    }
}
