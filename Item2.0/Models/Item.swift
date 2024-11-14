//
//  Item.swift
//  Item2.0
//
//  Created by Joseph DeWeese on 11/11/24.
//

import SwiftUI
import SwiftData

@Model
final class Item {
    var dateAdded: Date = Date.now
    var title: String = ""
    var summary: String = ""
    var dateStarted: Date = Date.distantPast
    var dateCompleted: Date = Date.distantPast
    var itemTint: String = ""
    var status: Status.RawValue = Status.Active.rawValue
    @Relationship(deleteRule: .cascade)
    var updates: [Update]?
    @Relationship(inverse: \Tag.items)
    var tags: [Tag]?
    //    @Relationship(deleteRule: .cascade)
    //    var tasks: [Task]?
    init(
        dateAdded: Date = Date.now,
        title: String = "",
        summary: String = "",
        dateStarted: Date = Date .distantPast,
        dateCompleted: Date = Date.distantPast,
        status: Status = .Active,
        itemTint: String = "",
        
        tags: [Tag]? = nil
    ) {
        self.dateAdded = dateAdded
        self.title = title
        self.summary = summary
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.status = status.rawValue
        self.itemTint = itemTint
        self.tags = tags
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .Queue:
            Image(systemName: "pause.circle")
            
        case .Active:
            Image(systemName: "play.circle")
        case .Completed:
            Image(systemName: "stop.circle")
        }
    }
    
    
    enum Status: Int, Codable, Identifiable, CaseIterable {
        case Queue, Active, Completed
        var id: Self {
            self
        }
        var descr: LocalizedStringResource {
            switch self {
            case .Queue:
                "Queue"
            case .Active:
                "Active"
            case .Completed:
                "Completed"
            }
        }
    }
}

