//
//  Utils.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/14/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import UIKit
import SwiftUI


struct MockData {
    static let title = "Tutorial"
    static let headers = [
        "Tip #1",
        "Tip #2",
        "Tip #3",
        "Tip #4",
        "Tip #5",
    ]
    static let contentStrings = [
        "Press '+' sign in top left to add new task!",
        "Swipe from left to right to delete the task!",
        "Hold 'Star' icon to mark important task!",
        "Click on task to open details page!",
        "Click on 'Expand' icon to show more data if it exists!"
    ]
    static let imageNames = [
        "tut1",
        "tut2",
        "tut3",
        "tut4",
        "tut5"
    ]

    static let colors = [
        "81BFD8",
        "81D89A",
        "D88181",
        "D8B281",
        "D8D781"
        ].map{ Color(hex: $0) }

    static let textColors = [
        "FFFFFF",
        "4A4A4A",
        "FFFFFF",
        "4A4A4A",
        "FFFFFF"
        ].map{ Color(hex: $0) }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff


        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
