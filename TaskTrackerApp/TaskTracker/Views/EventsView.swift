//
//  EventsView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventsView: View {
    @ObservedObject private var eventViewModel = EventViewModel()
    
    private var data: [Post] {
        eventViewModel.data?.events ?? []
    }
    
    var body: some View {
        List {
            ForEach(data) { post in
                NavigationLink(destination: DetailView(viewModel: eventViewModel, post: post), label: {
                HStack {
                    WebImage(url: post.imageUrl)
                        .resizable()
                        .placeholder {
                            Rectangle().fill(Color.gray)
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(12)
                    
                    Text(post.body)
                    
                }
                })
            }
        }.frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
