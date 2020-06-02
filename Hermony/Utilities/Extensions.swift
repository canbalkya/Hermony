//
//  Extensions.swift
//  Harmolor
//
//  Created by Can Balkaya on 6/2/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

extension Color {
    
    // MARK: - Properties
    static var mainBackground: Color {
        return Color(#function)
    }
}

extension UIColor {
    
    // MARK: - Properties
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
