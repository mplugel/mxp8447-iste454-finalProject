//
//  NoteRowView.swift
//  NoteApp
//
//  Created by Andrej Saric on 10/2/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct TaskRowView: View {
    var note: Task
    @ObservedObject var viewModel: TaskViewModel

    @State private var shouldShow = false
    @State private var important = false

    
    private var heartIcon: String {
        note.favorite ? "heart.fill" : "heart"
    }
    
    private var starIcon: String {
        note.favorite ? "star.fill" : "star"
    }
    
   
    
    private var category: Color {
        if note.category == "Health"{
            return .red}
        if note.category == "Study"{
            return .blue}
        if note.category == "Free time"{
            return .green}
        return .black
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(note.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(note.content)
                    .font(.body)
                Text(note.category)
                    .font(.caption)
                Text("\(note.date)")
                    .font(.footnote)
                    .fontWeight(.bold)
            }
            
            Spacer()
                    
            Image(systemName: starIcon)
                .onTapGesture {}
                .onLongPressGesture {
                    self.viewModel.toggleFavorite(note: note)
                }
                .foregroundColor(.yellow)
                .scaleEffect(shouldShow ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
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

struct NoteRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(note: Task(title: "Test", content: "Test Content", category: "Study", date: Date()), viewModel: TaskViewModel())
    }
}
