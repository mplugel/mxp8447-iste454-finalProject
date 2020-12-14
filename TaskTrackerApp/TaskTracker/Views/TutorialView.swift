//
//  TutorialView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/14/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI
import ConcentricOnboarding

struct TutorialView: View {
    var body: some View {
            let pages = (0...4).map { i in
                AnyView(PageView(title: MockData.title, imageName: MockData.imageNames[i], header: MockData.headers[i], content: MockData.contentStrings[i], textColor: MockData.textColors[i]))
            }

            var a = ConcentricOnboardingView(pages: pages, bgColors: MockData.colors)

            a.didGoToLastPage = {
            }
            return a
        }
}

//struct TutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialView()
//    }
//}
