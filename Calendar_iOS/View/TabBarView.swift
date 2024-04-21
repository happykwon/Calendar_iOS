//
//  TabBarView.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/19/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            // 첫 번째 탭
            CustomNavigationView {
                ActionView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Scheduel")
            }
            // 두 번째 탭
            CustomNavigationView {
                ActionView()
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Action")
            }
            // 세 번째 탭
            Text("메뉴")
                .tabItem {
                    Image(systemName: "tray")
                    Text("Menu")
                }
            // 네 번째 탭
            Text("라이브러리")
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
            // 다섯 번째 탭
            Text("설정")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.blue)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    TabBarView()
}
