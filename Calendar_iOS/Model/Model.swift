//
//  Model.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/18/24.
//

import Foundation
import SwiftUI

struct DateValue: Identifiable, Hashable {
    let id = UUID()
    let day: Int
    let date: Date
    let title: String
    let color: Color
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
}

struct Event: Identifiable  {
    let id = UUID()
    var title: String
    var content: String
    var startDate: Date
    var endDate: Date
    var EvnetColors: Color
}
