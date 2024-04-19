//
//  NavigationView.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/19/24.
//
import SwiftUI

struct CustomNavigationView<Content: View>: View {
    @ViewBuilder var content: Content
    private var date = Date()

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            NavigationView {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("TODAY") {
                                // 버튼 액션 설정
                            }
                            .foregroundColor(.white)
                        }

                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // 메뉴 버튼의 액션
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .navigationTitle(DateFormatter.getMonthYearString(for: date))
                    .navigationBarColor(backgroundColor: .systemBlue, titleColor: .white)
            }
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView {
            Text("NavigationView")
        }
    }
}
