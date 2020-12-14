//
//  CreateTaskView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject var viewModel: TaskViewModel
    @State private var title = ""
    @State private var content = ""
    @State private var subtask = ""
    @State private var category = ""
    @State private var valueSelected = 0
    @State private var currentDateTime = Date()

    var body: some View {
        Form {
            TextField("Enter title", text: $title)
            TextField("Enter content", text: $content)
            Picker(selection: $valueSelected, label: Text("Choose task")) {
                            Text("Health").tag(0)
                            Text("Study").tag(1)
                            Text("Free time").tag(2)

                        }.pickerStyle(SegmentedPickerStyle())
            TextField("Enter subtasks", text: $subtask).frame(height: 50)

            
            DatePicker("Select Date", selection: $currentDateTime, in: Date()...)
            
            Button(action: { self.createTask() }) {
                Text("Add Task")
            }
            .environment(\.isEnabled, !title.isEmpty && !content.isEmpty)
        }.onAppear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
    
    private func createTask() {
        if valueSelected == 0 {category = "Health"}
        if valueSelected == 1 {category = "Study"}
        if valueSelected == 2 {category = "Free time"}

        viewModel.create(title: title, content: content, category: category, date: currentDateTime, subtask: subtask)
        presentationMode.wrappedValue.dismiss()
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView(viewModel: TaskViewModel())
    }
}
