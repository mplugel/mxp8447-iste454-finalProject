//
//  TaskRowView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 10/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    @ObservedObject var viewModel: TaskViewModel

    @State private var shouldShow = false
    @State private var important = false

    
    private var heartIcon: String {
        task.favorite ? "heart.fill" : "heart"
    }
    
    private var starIcon: String {
        task.favorite ? "star.fill" : "star"
    }
    
   
    
    private var category: Color {
        if task.category == "Health"{
            return .red}
        if task.category == "Study"{
            return .blue}
        if task.category == "Free time"{
            return .green}
        return .black
    }
    
    private var img: String {
        if task.category == "Health"{
            return "hehe"}
        if task.category == "Study"{
            return "sss"}
        if task.category == "Free time"{
            return "spo"}
        return ""
    }
    
    var body: some View {
        
        ZStack {
            Image(img)
                .resizable()
                .scaledToFill()
                .cutoff()
            
            VStack(alignment: .leading) {
                Text(task.category)
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundColor(Color.white)
               
                Spacer()
            }
            .padding([.leading, .trailing], 16)
            .padding(.top, 30)
        }.frame(height: UIScreen.main.bounds.height * 0.20)
        
        HStack {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(task.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(task.content)
                    .font(.body)
//                Text(task.category)
//                    .font(.caption)
                
            }
            
            Spacer()
                    
            Image(systemName: starIcon)
                .scaleEffect(1.5)
                .onTapGesture {}
                .onLongPressGesture {
                    self.viewModel.toggleImportant(task: task)
                }
                .foregroundColor(.yellow)
                .scaleEffect(shouldShow ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.shouldShow = true
                    }
                }
        }
        .padding()

        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(category).opacity(0.1)
                .shadow(radius: 4)
        )
    }
}

//struct NoteRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskRowView(note: Task(title: "Test", content: "Test Content", category: "Study", date: Date()), viewModel: NoteViewModel())
//    }
//}
