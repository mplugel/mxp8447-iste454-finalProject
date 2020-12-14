//
//  Corner+extension.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(roundedRect: rect,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius,
                                                          height: cornerRadius)).cgPath
        
        return Path(bezierPath)
    }
}
