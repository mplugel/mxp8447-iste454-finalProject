//
//  TaskDetailView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/12/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct TaskDetailView: View {
    @State private var isSummaryExpanded = false
    
    private var expandIcon: String {
        isSummaryExpanded ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right"
    }
    
    @ObservedObject var viewModel: TaskViewModel
    var task: Task
    
    private var category: String {
        if task.category == "Health"{
            return "hehe"}
        if task.category == "Study"{
            return "sss"}
        if task.category == "Free time"{
            return "spo"}
        return ""
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(category)
                    .resizable()
                    .scaledToFill()
                    .cutoff()
                
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.system(size: 50, weight: .heavy, design: .rounded))
                        .foregroundColor(Color.white)
                    Text(task.category)
                        .font(.system(size: 25, weight: .light, design: .rounded))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding([.leading, .trailing], 32)
                .padding(.top, 60)
            }.frame(height: UIScreen.main.bounds.height * 0.5)
            // End ZStack
            
            VStack {
                HStack(spacing: 24) {
                    Spacer()
                    if(task.favorite){
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(Color.yellow)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    }else{
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }

                }
                
                HStack {
                    Text("About")
                        .font(.system(size: 50, weight: .heavy, design: .rounded))
                    Spacer()
                    Button(action: {
                        self.isSummaryExpanded.toggle()
                    }) {
                        Image(systemName: expandIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .accentColor(.black)
                    }
                }
                VStack(alignment: .leading){
                    Text("Title: " + task.title)
                    .font(.title2)
                Text("Category: " + task.category)
                    .font(.footnote)
                    .italic()
                Text("\(task.date)")
                    .font(.system(size: 14, weight: .heavy))
                    .padding(.bottom)
                    
                Text("Description: " + task.content)
                    .font(.body)
                    .lineLimit(isSummaryExpanded ? nil : 4)
                    .animation(.easeInOut(duration: 1.0))
                    if(task.subtask != ""){
                        Text("Subtasks: " + task.subtask!)
                    .lineLimit(isSummaryExpanded ? nil : 4)
                    .animation(.easeInOut(duration: 1.0))
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Motivational quote").font(.title3).italic().padding(.top)
                    Text("Every day, think as you wake up, today I am fortunate to be alive, I have a precious human life, I am not going to waste it. I am going to use all my energies to develop myself, to expand my heart out to others; to achieve enlightenment for the benefit of all beings. I am going to have kind thoughts towards others, I am not going to get angry or think badly about others. I am going to benefit others as much as I can.").lineLimit(isSummaryExpanded ? nil : 4)
                        .animation(.easeInOut(duration: 1.0))
                }
                
            }
            .padding([.leading, .trailing], 32)
            .offset(y: -100)
        }.edgesIgnoringSafeArea(.top)
    }
}

//struct TaskDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetailView(viewModel: NoteViewModel(), note: Note)
//    }
//}
