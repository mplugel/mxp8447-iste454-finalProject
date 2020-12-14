//
//  HomeView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        
        ZStack {
            
            Color.appBlue
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
            
            VStack {
                VStack {
                    Text("Task Tracker").font(.largeTitle).bold().foregroundColor(Color.white).shadow(radius: 4)
                    Spacer()
                    Image("logo-2")
                        .resizable()
                        .frame(width: screenWidth*0.3,
                               height: screenWidth*0.3)
                    Spacer()
                }.frame(height: screenHeight*0.2)
                
                    SimpleTaskView(shouldShowFavorites: false, viewModel: viewModel)
                    .roundCorners(cornerRadius: 20, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
            Text("Matej Plugel, 2020")
                .padding(.bottom)
                
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: TaskViewModel())
    }
}
