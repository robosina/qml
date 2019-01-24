import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import com.mycompany.FileIO 1.0
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 1800
    height: 1200
    color: "#E7EBF6"
    title: qsTr("My notes")
    property var anArray:["1","2","3","4"]


    Item {
        width: 1039
        height: 767
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            anchors.top: parent.top
        }

        ListView {
            spacing: 60
            id: listView
            x: 62
            y: 152
            width: 924
            height: 568
            delegate: Item {
                x: 5
                width: 80
                height: 40
                Rectangle{
                    id:rec
                    border.color: "#000000"
                    width: parent.width*12
                    height: parent.height*2
                    color: bgcolor
                    radius: 10
                    scale: 1
                    Slider {
                        id: slider
                        x: parent.width-50
                        y: 20
                        width: 70
                        height: 20
                        value: sld_val
                        rotation: 270
                    }
                    Text {
                        id: percent
                        text:Number(Math.floor(slider.value*100)).toLocaleString()+"%"
                        x: parent.width-25
                        y: 60
                        font.pixelSize: 10
                        color: "#0000FF"
                    }
                    TextField {
                        text: name
                        font.bold: false
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "B NAZANIN"
                        font.pointSize: 12
                        color: "#333333"
                        x:50
                        y:10
                        height: 50
                        width: 800
                        background: Rectangle {
                            radius: 2
                            implicitWidth: 100
                            implicitHeight: 24
                            border.color: rec.color
                            color: rec.color
                            border.width: 1
                            height: 50
                            width: parent.width
                        }

                    }

                    Rectangle {
                        id:par
                        width: 30
                        height: 30
                        radius: 20
                        border.color: brcolor
                        color: bkcolor
                        x:10
                        y:20
                        antialiasing: true

                        property int color_index: idx_val
                        function change_color_index()
                        {
                            if(color_index==1)
                            {
                                color_index=0
                                return "#E91E63"
                            }
                            else
                            {
                                color_index=1
                                return "#009688"
                            }
                        }

                        function change_border_color()
                        {
                            if(color_index==0)
                            {
                                return "#EF9A9A"
                            }
                            else
                            {
                                return "#80CBC4"
                            }
                        }
                        //2:section for animated press button
                        MouseArea {
                            id: mouseArea;
                            anchors.fill: parent
                            onClicked: {
                                par.state = "pressed"
                                stateTimer.start()
                                parent.color = parent.change_color_index()
                                parent.border.color=parent.change_border_color()
                                console.log(parent.color_index)
                            }

                        }

                        Text {
                            color: "#fff"
                            anchors.centerIn: par
                            font.pixelSize: 12
                        }

                        states: State {
                            name: "pressed"
                            PropertyChanges { target: par; scale: 0.7 }
                        }

                        Timer {
                            id: stateTimer
                            interval: 120;
                            repeat: false
                            onTriggered: par.state = 'State0'
                        }

                        transitions: Transition {
                            NumberAnimation { properties: "scale"; duration: 120; easing.type: Easing.InOutQuad }
                        }

                        //end of sec 2
                    }
                }
            }
            FileIO {
                id: myfile
                source: "/home/nict/Desktop/ttotal.txt"
            }


            model: ListModel {
                id:p1model
            }
        }
        Text {
            id: text1
            x: 62
            y: 796
            width: 196
            height: 30
            color: "#7d7d7d"
            text: qsTr("Add new question")
            verticalAlignment: Text.AlignVCenter
            font.family: "Times New Roman"
            transformOrigin: Item.Center
            font.pixelSize: 21
        }

        Rectangle {
            id: rectangle
            x: 62
            y: 854
            width: 969
            height: 112
            color: "#b1c9ee"
            z: -3

            TextField {
                id: textInput
                x: 8
                y: 8
                width: 741
                height: 96
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.family: "b nazanin"
                background: Rectangle {
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#EEEEEE"
                    border.width: 1
                }
            }
        }
        FileIO{
            id:file_n
            source: "/home/nict/qtProject/questions/question.txt"
        }

        Rectangle{
            x: 816
            y: 864
            width: 96
            height: 96
            color: "#000000"
            radius: 48
            z: -2
            Image {
                x: 16
                y: 17
                width: 65
                height: 62
                id: image
                source: "send-mail.png"

                MouseArea {
                    id: mouseArea1;
                    anchors.fill: parent
                    onClicked: {
                        image.state = "pressed"
                        stateTimer1.start()
                        console.log("new problem has been added")
                    }
                }

                Text {
                    width: 0
                    height: 13
                    color: "#fff"
                    verticalAlignment: Text.AlignVCenter
                    anchors.centerIn: image
                    font.pixelSize: 12
                }

                states: State {
                    name: "pressed"
                    PropertyChanges { target: image; scale: 0.7 }
                }

                Timer {
                    id: stateTimer1
                    interval: 120;
                    repeat: false
                    onTriggered: image.state = 'State0'
                }

                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 120; easing.type: Easing.InOutQuad }
                }
            }
        }

        Rectangle {
            id: rectangle1
            x: 918
            y: 864
            width: 94
            height: 94
            color: "#000000"
            radius: 47
            Text {
                id: textr
                x: -28
                y: 10
                width: 119
                height: 84
                anchors.centerIn: parent
                text: qsTr("Load\n Reviews")
                anchors.verticalCenterOffset: 3
                anchors.horizontalCenterOffset: 1
                fontSizeMode: Text.Fit
                font.pixelSize: 20
                font.family: "times"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#d0d9fd"
            }
            function salam()
            {
                p1model.clear()
                for(var i=0;i<file_n.number_of_string()-1;i++)
                {
                    if(file_n.is_idle(i)==1)
                    {
                        p1model.append({"name":file_n.read(i),"bgcolor":"#FFFFFF",bkcolor:"#009688",brcolor:"#80CBC4",idx_val:1,sld_val:0.9})
                    }
                    else{
                        p1model.append({"name":file_n.read(i),"bgcolor":"#FFFFFF",bkcolor:"#E91E63",brcolor:"#EF9A9A",idx_val:0,sld_val:0.3})
                    }
                }
            }
            MouseArea {
                id: mouseArea2;
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                onClicked: {
                    rectangle1.state = "pressed"
                    stateTimer2.start()
                    file_n.read(1)
                    parent.salam()
                }
            }

            states: State {
                name: "pressed"
                PropertyChanges { target: rectangle1; scale: 0.9 }
            }

            Timer {
                id: stateTimer2
                interval: 120;
                repeat: false
                onTriggered: rectangle1.state = 'State0'
            }

            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 120; easing.type: Easing.InOutQuad }
            }
        }

        Rectangle {
            x: 8
            y: 64
            width: 45
            height: 45
            color: "#ffffff"
            radius: 23
            border.color: "#000000"
        }

        Text {
            id: text2
            x: 62
            y: 64
            width: 225
            height: 30
            color: "#7d7d7d"
            text: qsTr("Search in ")
            font.pixelSize: 21
            verticalAlignment: Text.AlignVCenter
            transformOrigin: Item.Center
            font.family: "Times New Roman"
        }

        Rectangle {
            x: 8
            y: 796
            width: 45
            height: 45
            color: "#ffffff"
            radius: 23
            border.color: "#000000"
            antialiasing: true
        }

        TextField {
            id: textField
            x: 339
            y: 65
            width: 516
            height: 44
            placeholderText: "search something"
            horizontalAlignment: Text.AlignHCenter
            background: Rectangle {
                radius: 30
                border.color: "#d2c9c9"
                implicitWidth: 100
                implicitHeight: 24
                border.width: 1
            }
        }

        Image {
            id: image2
            x: 349
            y: 71
            width: 34
            height: 34
            antialiasing: true
            smooth: true
            source: "search.svg"
            mipmap: true
        }
    }

    Image {
        id: image1
        x: 1049
        y: 80
        width: 737
        height: 858
        source: "Oxygen480-actions-mail-mark-task.svg.png"
    }


}

