//
//  View +.swift
//  Calendar_iOS
//
//  Created by 권태호 on 4/19/24.
//

import Foundation
import SwiftUI

extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}
