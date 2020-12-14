//
//  TaskListView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 10/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    var shouldShowFavorites: Bool
    @ObservedObject var viewModel: TaskViewModel
    
    private var data: [Task]{
        return shouldShowFavorites ? viewModel.favorites : viewModel.data
    }
    
    var body: some View {
        if data.isEmpty{
            Text("No important tasks added!")
        }else{
        
        List {
            ForEach(data) { task in
                NavigationLink(destination: TaskDetailView(viewModel: viewModel, task: task), label: {
                    TaskRowView(task: task, viewModel: viewModel)
                })
                    .padding(.trailing, 20)
                    
                
            }.onDelete(perform: viewModel.delete)
        }
        .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                .modifier(CardModifier())
                .padding(.all, 10)
        .onAppear {
            
            self.viewModel.refreshData()
            UITableView.appearance().separatorStyle = .none
        }
    }
    }
}

//struct NoteListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteListView(shouldShowFavorites: false, viewModel: NoteViewModel())
//    }
//}
