//
//  DateFormatter +.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/18/24.
//

import Foundation
extension DateFormatter {
    static func getMonthYearString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}
