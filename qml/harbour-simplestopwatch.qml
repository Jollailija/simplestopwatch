/*
  Copyright (C) 2015 jollailija
  Contact: jollailija <jollailija@gmail.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
//import harbour.simplestopwatch.insomniac 1.0

ApplicationWindow
{
    Timer {
        id: timer
        property bool running: false
        property int ms: 0
        property int s: 0
        property int m: 0
        interval: 100
        repeat: true
        onTriggered: (timer.ms < 9) ? (timer.ms++ ) : (timer.ms = 0, timer.s > 58 ? (timer.s = 0, timer.m++) : timer.s++)
    }

    initialPage: Component {
        Page {
            SilicaFlickable {
                anchors.fill: parent
                contentHeight: parent.height

                PullDownMenu {
                    enabled: !timer.running
                    Label {
                        text: qsTr("Version ") + "0.2.0-1"
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Theme.highlightColor
                    }
                    MenuItem {
                        text: "Reset"
                        onClicked: {
                            timer.ms = 0
                            timer.s = 0
                            timer.m = 0
                            //console.debug("reset")
                        }
                    }
                }
                PageHeader {
                    // I thought it was a bit weird to have just an empty page with numbers.
                    title: qsTr("Stopwatch")
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: Theme.paddingLarge
                    onClicked: timer.running ? (timer.stop(), timer.running = false/*, console.debug("stop")*/) : (timer.start(), timer.running = true/*, console.debug("start")*/)

                }

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: timer.m + ":" + timer.s + "." + timer.ms
                    font.pixelSize: Theme.fontSizeExtraLarge * 3
                }
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: Theme.paddingLarge * 2
                    color: Theme.highlightColor
                    text: timer.running ? qsTr("Tap anywhere to stop") : qsTr("Tap anywhere to start")
                }

            }
        }
    }

    cover: Component {
        CoverBackground {
            Image {
               source: "harbour-simplestopwatch.png"
               anchors.horizontalCenter: parent.horizontalCenter
               y: parent.height * 0.15
             }
            Label {
                y: parent.height * 0.45
                anchors.horizontalCenter: parent.horizontalCenter
                text: timer.m + ":" + timer.s + "." + timer.ms
                font.pixelSize: Theme.fontSizeExtraLarge * 1.5
            }

            CoverActionList {
                id: coverAction


                CoverAction {
                    iconSource: timer.running ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play"
                    onTriggered: timer.running ? (timer.stop(), timer.running = false, console.debug("stop")) : (timer.start(), timer.running = true, console.debug("start"))
                }

                CoverAction {
                    iconSource: "image://theme/icon-cover-refresh"
                    onTriggered: {
                        timer.stop()
                        timer.running = false
                        timer.ms = 0
                        timer.s = 0
                        timer.m = 0
                        //console.debug("reset")
                    }
                }
            }
        }
    }
}


