//
//  Event.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import Foundation


struct Post: Codable, Identifiable {
    let eventId: Int
    let id: Int
    let body: String
    let imageUrl: URL?
    let description: String
    let longitude: Double?
    let latitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case eventId = "event_id"
        case id
        case body
        case imageUrl
        case description
        case longitude
        case latitude
    }
}

struct Event: Codable {
    let id: Int
    let appName: String
    let events: [Post]
    
    
}
