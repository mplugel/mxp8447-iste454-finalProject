//
//  ContentView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 10/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    // Xcode 12
//    @StateObject private var viewModel = NoteViewModel()

    // Xcode 11
    @ObservedObject private var viewModel = TaskViewModel()
    
    @State private var sheetVisible = false
    @State var showMenu = false

    var body: some View {
        
        let drag = DragGesture()
                    .onEnded {
                        if $0.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    }
        
        TabView {
            
            NavigationView {
                ZStack(alignment: .leading) {
                HomeView(viewModel: viewModel)
              //      .navigationBarTitle("Home")
                    .navigationBarItems(leading: (
                                        Button(action: {
                                            withAnimation {
                                                self.showMenu.toggle()
                                            }
                                        }) {
                                            Image(systemName: "line.horizontal.3")
                                                .imageScale(.large)
                                                .foregroundColor(Color.white)
                                        }
                                    ), trailing: Button(action: {
                                        self.sheetVisible = true
                                    }) {
                                        Image(systemName: "plus")
                                            .imageScale(.large)
                                            .foregroundColor(Color.white)
                                    })
                if self.showMenu {
                    MenuView()
                        .frame(width: 200)
                    }
            }.gesture(drag)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            
            NavigationView {
                ZStack(alignment: .leading) {
                TaskListView(shouldShowFavorites: false, viewModel: viewModel)
                    .navigationBarTitle("Tasks")
                    .navigationBarItems(leading: (
                                        Button(action: {
                                            withAnimation {
                                                self.showMenu.toggle()
                                            }
                                        }) {
                                            Image(systemName: "line.horizontal.3")
                                                .imageScale(.large)
                                        }
                                    ), trailing: Button(action: {
                                        self.sheetVisible = true
                                    }) {
                                        Image(systemName: "plus")
                                            .imageScale(.large)
                                    })
                    
                    if self.showMenu {
                        MenuView()
                            .frame(width: 200)
                        }
                    
                }.gesture(drag)
            }
            
            .tabItem {
                Image(systemName: "bookmark")
                Text("Tasks")
                
            }
            
            
            NavigationView {
                TaskListView(shouldShowFavorites: true, viewModel: viewModel)
                    .navigationBarTitle("Important")
            }
            .tabItem {
                Image(systemName: "star")
                Text("Important")
            }
            
            NavigationView {
                EventsView()
                    .navigationBarTitle("Events")
            }
            .tabItem {
                Image(systemName: "waveform")
                Text("Events")
            }
            
        }.sheet(isPresented: $sheetVisible) {
            CreateTaskView(viewModel: self.viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
