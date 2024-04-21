//
//  Date +.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/18/24.
//

import Foundation

extension Date {
    public var year: String {
        return String(Calendar.current.component(.year, from: self))
    }
    public var month: String {
        return String(Calendar.current.component(.month, from: self))
    }
//    public var day: String {
//        return String(Calendar.current.component(.day, from: self))
//    }
//    public var weekday: String {
//        return String(Calendar.current.component(.weekday, from: self))
//    }
    
    // MARK: - method
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
    
    func getLastDayInMonth() -> Int {
        let calendar = Calendar.current
        return (calendar.range(of: .day, in: .month, for: self)?.endIndex ?? 0) - 1
    }
    
    
    //이 날짜가 포함된 월의 첫 일
    func getFirstDayInMonth() -> Int {
        let calendar = Calendar.current
        
        return (calendar.range(of: .day, in: .month, for: self)?.startIndex ?? 0)
    }
    
    
    // 시간 값을 제외한 Date 리턴
    func withOutTime() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        if let dateWithoutTime = calendar.date(from: components) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter.string(from: dateWithoutTime)
        } else {
            return "withOutTime Method Error"
        }
    }
}

extension Date {
    var weekday: Int {
        let calendar = Calendar.current
        return calendar.component(.weekday, from: self)
    }

    var day: Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    }

    var monthInt: Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: self)
    }

    var monthYearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }

    var previousMonth: Date {
        let calendar = Calendar.current
        guard let newDate = calendar.date(byAdding: .month, value: -1, to: self) else {
            return self
        }
        return newDate
    }

    var nextMonth: Date {
        let calendar = Calendar.current
        guard let newDate = calendar.date(byAdding: .month, value: 1, to: self) else {
            return self
        }
        return newDate
    }

    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}

