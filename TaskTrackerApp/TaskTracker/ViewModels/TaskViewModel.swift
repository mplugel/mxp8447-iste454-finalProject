//
//  TaskViewModel.swift
//  TaskTracker
//
//  Created by Matej Plugel on 10/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published private(set) var data: [Task] = []
    @Published private(set) var favorites: [Task] = []
    @Published private(set) var today: [Task] = []
    @Published var health = false
    @Published var study = false


    private var tasks = [
        Task(title: "Doctor check", content: "Regular control at Dr.Doc", category: "Health", subtask: "Make appointment, take a shower, call an Uber, bring papers", date: Date()),
        Task(title: "Indoor foot", content: "Minifoot termin with friends", category: "Free time", subtask: "", date: Date()),
        Task(title: "Exam", content: "Final exam from App Dev.", category: "Study", subtask: "Remind homeworks, check mini project", date: Date()),
        Task(title: "Game night", content: "Among us night", category: "Free time", subtask: "Get beer, get popcorn, warm up the machine, run few games as impostor, prepare tactics, enjoy", date: Date())
        ] {
        didSet {
            refreshData()
        }
    }
    
    func refreshData(){
        data = tasks
        favorites = tasks.filter({ $0.favorite })
    }
    
    init() {
        data = tasks
    }
    
    func create(title: String, content: String, category: String, date: Date, subtask: String) {
        tasks.append(Task(title: title, content: content, category: category, subtask: subtask, date: date))
        
    }
    
    func toggleImportant(task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        
        tasks[index].favorite.toggle()
    }
    
    func delete(offset: IndexSet) {
        tasks.remove(atOffsets: offset)
    }
    
    
    func getCategory(task: Task){
        if task.category == "Health" {
           health = true
        } else{
            study = true
        }
    }
    
}
