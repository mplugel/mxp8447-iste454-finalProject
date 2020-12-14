//
//  View+extension.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

extension View {
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    func roundCorners(cornerRadius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornersShape(cornerRadius: cornerRadius, corners: corners))
    }
}
