//
//  Task.swift
//  TaskTracker
//
//  Created by Matej Plugel on 10/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let category: String
    let subtask: String?
    let date: Date
    var favorite = false
}
