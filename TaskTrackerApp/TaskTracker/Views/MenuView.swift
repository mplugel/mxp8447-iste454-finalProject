//
//  MenuView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: CreatorView(), label: {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Creator")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                        .padding(.top, 120)
            })
            NavigationLink(destination: TutorialView(), label: {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Tutorial")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                        .padding(.top, 30)
            })
            
                    
                        Spacer()
                }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(red: 32/255, green: 32/255, blue: 32/255))
                    .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
