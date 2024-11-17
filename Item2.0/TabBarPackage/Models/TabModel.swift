//
//  TabModel.swift
//  Discipline
//
//  Created by J. DeWeese on 10/30/23.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    case coffee = "Coffee"
    case Objectives = "Objectives"
    case tasks = "Tasks"
    case notes = "Notes"
    
    var systemImage: String {
        switch self {
        case .Objectives:
            return "location.north.fill"
        case .tasks:
            return "checkmark.circle.fill"
        case .notes:
            return "square.and.pencil.circle.fill"
        case .coffee:
            return "mug.fill"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

