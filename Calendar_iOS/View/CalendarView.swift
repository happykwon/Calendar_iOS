//
//  CalendarView.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/19/24.
//

import SwiftUI

struct CalendarView: View {
    
    let testDate = Event(title: "테스트1입니다.", content: "테스트1", startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date(), EvnetColors: Color.brown)
    
    @State var currentDate = Date()
    @State var daysList = [[DateValue]]()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Group {
                    let days = Days.allCases
                    HStack(spacing: 0) {
                        ForEach(days, id: \.self) { day in
                            Text(day.rawValue)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.top, 0)
                Text("Hello, World!")
            }
            .padding(.top, 0)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("TODAY") {
                        // 버튼 액션 설정
                        currentDate = Date()
                    }
                    .foregroundColor(.white)
                }
                // 메뉴 버튼을 네비게이션 바 오른쪽에 추가
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 메뉴 버튼의 액션
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle(DateFormatter.getMonthYearString(for: currentDate)) // 현재 연도와 월 표시
            .navigationBarColor(backgroundColor: .systemBlue, titleColor: .white)
            
        }
    }
}

#Preview {
    CalendarView()
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

