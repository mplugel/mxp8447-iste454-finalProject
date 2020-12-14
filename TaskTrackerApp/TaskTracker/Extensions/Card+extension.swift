//
//  Card+extension.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/14/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
