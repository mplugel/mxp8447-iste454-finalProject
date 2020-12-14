//
//  CreatorView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct CreatorView: View {
    var body: some View {
        VStack(alignment: .center){
        Text("Built by: MXP8447").font(.largeTitle)
        Text("Mobile Application Development I").font(.subheadline)
        }
    }
}

struct CreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorView()
    }
}
