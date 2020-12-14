//
//  EventViewModel.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published private(set) var data: Event? = nil
    @Published private(set) var wishList: [Event] = []

    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        retrieveData()
    }
    
    func retrieveData() {
        guard let url = URL(string: "https://demo4035718.mockable.io/events") else {
            return
        }

         URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: Event.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.data = $0 })
            .store(in: &cancellable)

        
    }
}
