//
//  EventManager.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/18/24.
//

import Foundation
import SwiftUI

class EventManager: ObservableObject {
    @Published var events: [Event] = []
    private let eventManagerQueue = DispatchQueue(label: "eventManagerQueue")
    
    func addEvent(_ event: Event) {
        eventManagerQueue.async {
            self.events.append(event)
        }
    }
    
    func getEvnetList() -> [Event] {
        return eventManagerQueue.sync {
            events
        }
    }
    
    func removeEvent(with id: UUID) {
        eventManagerQueue.sync {
            events.removeAll() { $0.id == id }
        }
    }
    
    func removeAllEvent() {
        eventManagerQueue.sync {
            events.removeAll()
        }
    }
    
}
