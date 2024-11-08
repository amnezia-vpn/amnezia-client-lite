pragma Singleton

import QtQuick

QtObject {
    property QtObject color: QtObject {
        readonly property color transparent: 'transparent'
        readonly property color paleGray: '#171717'
        readonly property color lightGray: '#292929'
        readonly property color mutedGray: '#484A4D'
        readonly property color charcoalGray: '#808080'
        readonly property color slateGray: '#E3E5ED'
        readonly property color onyxBlack: '#FCFCFD'
        readonly property color midnightBlack: '#FCFCFD'
        readonly property color goldenApricot: '#855103'
        readonly property color burntOrange: '#DE8806'
        readonly property color mutedBrown: Qt.rgba(153/255, 138/255, 122/255, 0.5)
        readonly property color richBrown:  Qt.rgba(249/255, 158/255, 25/255, 0.5)
        readonly property color deepBrown: Qt.rgba(249/255, 158/255, 25/255, 0.5)
        readonly property color vibrantRed: '#EB5757'
        readonly property color darkCharcoal: Qt.rgba(249/255, 158/255, 25/255, 0.5)
        readonly property color sheerWhite: Qt.rgba(255, 255, 255, 0.12)
        readonly property color translucentWhite: Qt.rgba(255, 255, 255, 0.08)
        readonly property color barelyTranslucentWhite: Qt.rgba(255, 255, 255, 0.05)
        readonly property color translucentMidnightBlack: Qt.rgba(252/255, 253/255, 256/255, 0.8)
        readonly property color softGoldenApricot: Qt.rgba(153/255, 138/255, 122/255, 0.5)
        readonly property color mistyGray: '#292929'
        readonly property color cloudyGray: '#333333'
    }
}
