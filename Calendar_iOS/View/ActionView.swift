//
//  CalendarView.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/19/24.
//

import SwiftUI

struct ActionView: View {
    @StateObject private var eventManager = EventManager()
     @State private var currentDate = Date()
     
    var body: some View {
            GeometryReader { geometry in
                VStack() {
                    // 달력 뷰
                    CalendarGrid(eventManager: eventManager, currentDate: $currentDate)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }
        }
}
//파일프라이빗 만들기
struct CalendarGrid: View {
    @ObservedObject var eventManager: EventManager
    @Binding var currentDate: Date
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 7)

    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                let days = Days.allCases
                HStack(spacing: 0) {
                    ForEach(days, id: \.self) { day in
                        Text(day.rawValue)
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            ScrollView {
                LazyVGrid(columns: columns , spacing: 0) {
                    ForEach(daysInMonth(for: currentDate), id: \.self) { day in
                        if day.day == -1 {
                            Text("")
                        } else {
                            VStack {
                                Text("\(day.day)")
                                let eventList = eventManager.events.filter({ $0.startDate.isSameDay(as: day.date) })
                                if !eventList.isEmpty {
                                    ForEach(eventList) { event in
                                        Text(event.title)
                                            .foregroundColor(event.EvnetColors)
                                    }
                                }
                            }
                        }
                    }
                    .frame(minHeight: 128)
                }
            }
        }
        .padding()
    }
    
   private func daysInMonth(for date: Date) -> [DateValue] {
        var days = [DateValue]()
        let currentDate = Calendar.current
        let month = currentDate.component(.month, from: date)
        let year = currentDate.component(.year, from: date)
       _ = currentDate.range(of: .day, in: .month, for: date)!.count

        // 이전 달의 마지막 날짜 채우기
        var currentDay = currentDate.date(from: DateComponents(year: year, month: month, day: 1))!
        for _ in 1..<currentDay.weekday {
            days.append(DateValue(day: -1, date: Date(), title: "", color: .clear))
        }

        // 현재 달의 날짜 채우기
        while currentDay.monthInt == month {
            let eventList = eventManager.events.filter({ $0.startDate.isSameDay(as: currentDay) })
            let title = eventList.map({ $0.title }).joined(separator: ", ")
            let color = eventList.first?.EvnetColors ?? .clear
            days.append(DateValue(day: currentDay.day, date: currentDay, title: title, color: color))
            currentDay = currentDate.date(byAdding: .day, value: 1, to: currentDay)!
        }

        // 다음 달의 첫 날짜 채우기
        let remainingDays = 7 - days.count % 7
        for _ in 1...remainingDays {
            days.append(DateValue(day: -1, date: Date(), title: "", color: .clear))
        }
       
       if days.count % 7 == 0 {
           
       }
       return days
    }

}

#Preview {
    ActionView()
}


