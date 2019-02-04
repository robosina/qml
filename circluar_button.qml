import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick 2.12
import QtQuick.Shapes 1.11
import QtGraphicalEffects 1.12
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property real r1: 40
    property real r2: 90
    property real cx: 100
    property real cy: 100
    property string in_color: "#3F51B5"
    property string out_color: "#8888ff"
    Component.onCompleted: {
        console.log(Math.cos(3*Math.PI/4))
    }

    Shape{
        id:below
        x:100
        y:100
        width: 300
        height: 300
        layer.enabled: true
        layer.samples: 70
        Rectangle{
            x:cx-r1
            y:cy-r1
            width: 2*r1
            height: 2*r1
            radius: r1
            color: "#DDDDDD"
        }

        ShapePath {
            strokeWidth: 2
            dashPattern: [1, 4]
            startX: r1*Math.cos(Math.PI/4)+cx
            startY: r1*Math.sin(Math.PI/4)+cy
            strokeColor:out_color
            fillColor: in_color
            fillGradient:{
                LinearGradient
                start: Qt.point(0, 0)
                end: Qt.point(0, 300)
            }
            PathLine {
                x: r2*Math.cos(Math.PI/4)+cx
                y: r2*Math.sin(Math.PI/4)+cy
            }
            PathArc {
                x: r2*Math.cos(3*Math.PI/4)+cx
                y: r2*Math.sin(3*Math.PI/4)+cy
                radiusX: r2
                radiusY: r2
                useLargeArc: false
            }
            PathLine {
                x: r1*Math.cos(3*Math.PI/4)+cx
                y: r1*Math.sin(3*Math.PI/4)+cy
            }

            PathArc {
                x: r1*Math.cos(Math.PI/4)+cx
                y: r1*Math.sin(Math.PI/4)+cy
                radiusX: r1
                radiusY: r1
                useLargeArc: false
                direction: PathArc.Counterclockwise
            }
        }

        ShapePath {
            strokeWidth: 2
            dashPattern: [1, 4]
            startX: r1*Math.cos(7*Math.PI/4)+cx
            startY: r1*Math.sin(7*Math.PI/4)+cy
            strokeColor:out_color
            fillColor: in_color
            PathLine {
                x: r2*Math.cos(7*Math.PI/4)+cx
                y: r2*Math.sin(7*Math.PI/4)+cy
            }
            PathArc {
                x: r2*Math.cos(Math.PI/4)+cx
                y: r2*Math.sin(Math.PI/4)+cy
                radiusX: r2
                radiusY: r2
                useLargeArc: false
            }
            PathLine {
                x: r1*Math.cos(Math.PI/4)+cx
                y: r1*Math.sin(Math.PI/4)+cy
            }
            PathArc {
                x: r1*Math.cos(7*Math.PI/4)+cx
                y: r1*Math.sin(7*Math.PI/4)+cy
                radiusX: r1
                radiusY: r1
                useLargeArc: false
                direction: PathArc.Counterclockwise
            }
        }

        ShapePath {
            strokeWidth: 2
            dashPattern: [1, 4]
            startX: r1*Math.cos(5*Math.PI/4)+cx
            startY: r1*Math.sin(5*Math.PI/4)+cy
            strokeColor:out_color
            fillColor: in_color
            PathLine {
                x: r2*Math.cos(5*Math.PI/4)+cx
                y: r2*Math.sin(5*Math.PI/4)+cy
            }
            PathArc {
                x: r2*Math.cos(7*Math.PI/4)+cx
                y: r2*Math.sin(7*Math.PI/4)+cy
                radiusX: r2
                radiusY: r2
                useLargeArc: false
            }
            PathLine {
                x: r1*Math.cos(7*Math.PI/4)+cx
                y: r1*Math.sin(7*Math.PI/4)+cy
            }
            PathArc {
                x: r1*Math.cos(5*Math.PI/4)+cx
                y: r1*Math.sin(5*Math.PI/4)+cy
                radiusX: r1
                radiusY: r1
                useLargeArc: false
                direction: PathArc.Counterclockwise
            }
        }

        ShapePath {
            strokeWidth: 2
            dashPattern: [1, 4]
            startX: r1*Math.cos(3*Math.PI/4)+cx
            startY: r1*Math.sin(3*Math.PI/4)+cy
            strokeColor:out_color
            fillColor: in_color
            PathLine {
                x: r2*Math.cos(3*Math.PI/4)+cx
                y: r2*Math.sin(3*Math.PI/4)+cy
            }
            PathArc {
                x: r2*Math.cos(5*Math.PI/4)+cx
                y: r2*Math.sin(5*Math.PI/4)+cy
                radiusX: r2
                radiusY: r2
                useLargeArc: false
            }
            PathLine {
                x: r1*Math.cos(5*Math.PI/4)+cx
                y: r1*Math.sin(5*Math.PI/4)+cy
            }
            PathArc {
                x: r1*Math.cos(3*Math.PI/4)+cx
                y: r1*Math.sin(3*Math.PI/4)+cy
                radiusX: r1
                radiusY: r1
                useLargeArc: false
                direction: PathArc.Counterclockwise
            }
        }
    }
}
