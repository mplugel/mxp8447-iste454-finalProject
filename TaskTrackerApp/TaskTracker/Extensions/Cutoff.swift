//
//  Cutoff.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import Foundation
import SwiftUI

struct Cutoff: ViewModifier {
    enum Side {
        case left
        case right
    }
    
    var offset: CGFloat = 50
    var side: Side = .right
    
    private var rightOffset: CGFloat {
        side == .right ? offset : 0
    }
    
    private var leftOffset: CGFloat {
        side == .left ? offset : 0
    }
    
    func body(content: Content) -> some View {
        GeometryReader { reader in
            content
                .clipShape(Path { path in
                    path.addLines([
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: reader.size.width,
                                y: 0),
                        CGPoint(x: reader.size.width,
                                y: reader.size.height - self.leftOffset),
                        CGPoint(x: 0,
                                y: reader.size.height - self.rightOffset)
                    ])
                })
        }
    }
}

extension View {
    func cutoff(offset: CGFloat = 50, side: Cutoff.Side = .right) -> some View {
        self.modifier(Cutoff(offset: offset, side: side))
    }
}
