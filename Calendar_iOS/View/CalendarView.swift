//
//  CalendarView.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/19/24.
//

import SwiftUI

struct ActionView: View {
    
    let testDate = Event(title: "테스트1입니다.", content: "테스트1", startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date(), EvnetColors: Color.brown)
    
    @State var currentDate = Date()
    @State var daysList = [[DateValue]]()
    
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
        }
    }
}

#Preview {
    ActionView()
}

enum Days: String, CaseIterable {
    case sun = "SUN",
         mon = "MON",
         tue = "TUE",
         wed = "WED",
         thu = "THU",
         fri = "Fri",
         sat = "Sat"
}

