import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import SortFilterProxyModel 0.2

import PageEnum 1.0
import ProtocolEnum 1.0
import ContainerProps 1.0

import "./"
import "../Controls2"
import "../Controls2/TextTypes"
import "../Config"
import "../Components"

PageType {
    id: root

    HeaderType {
        id: header

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.topMargin: 20
        anchors.leftMargin: 16
        anchors.rightMargin: 16

        actionButtonImage: "qrc:/images/controls/plus.svg"
        backButtonImage: "qrc:/images/controls/arrow-left.svg"

        headerText: "Серверы"

        actionButtonFunction: function() {
            connectionTypeSelection.visible = true
        }

        backButtonFunction: function() {
            PageController.goToPageHome()
        }
    }

    ConnectionTypeSelectionDrawer {
        id: connectionTypeSelection
    }

    FlickableType {
        anchors.top: header.bottom
        anchors.topMargin: 16
        contentHeight: col.implicitHeight

        Column {
            id: col
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            anchors.leftMargin: 16
            anchors.rightMargin: 16

            spacing: 16

            ListView {
                id: servers
                width: parent.width
                height: servers.contentItem.height

                model: ServersModel

                clip: true

                delegate: Item {
                    implicitWidth: servers.width
                    implicitHeight: delegateContent.implicitHeight

                    ColumnLayout {
                        id: delegateContent

                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right

                        LabelWithButtonType {
                            id: server
                            Layout.fillWidth: true
                            Layout.topMargin: 16
                            Layout.bottomMargin: 16

                            text: name
                            descriptionText: hostName
                            buttonImage: "qrc:/images/controls/chevron-right.svg"

                            clickedFunction: function() {
                                ServersModel.setCurrentlyProcessedServerIndex(index)
                                goToPage(PageEnum.PageSettings)
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: "#2C2D30"
                        }
                    }
                }
            }
        }
    }
}
