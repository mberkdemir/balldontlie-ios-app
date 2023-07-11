//
//  ColorPallette.swift
//  NBA-Application
//
//  Created by Berk on 30.06.2023.
//

import UIKit

struct ColorPalette {
    
    // MARK: Main Colors of App
    static let ORANGE = UIColor(hex: "0xFF5E14")
    static let BLUE = UIColor(hex: "0x007AFF")
    static let GREEN = UIColor(hex: "0x34C759")
    static let YELLOW = UIColor(hex: "0xFFD60A")
    
    // MARK: Supporting Colors of App
    static let RED = UIColor(hex: "0xFF3B30")
    static let PURPLE = UIColor(hex: "0xAF52DE")
    static let GRAY = UIColor(hex: "0x8E8E93")
    static let GRAY_DARK = UIColor(hex: "0x1A1A1A")
    static let WHITE = UIColor(hex: "0xFFFFFF")
    static let BLACK = UIColor(hex: "0x000000")
    
}

struct Icons {
    
    // MARK: TabBar Icons
    static let GAMES = "basketball.fill"
    static let PLAYERS = "figure.basketball"
    static let TEAMS = "sportscourt.fill"
    static let STATS = "plus.forwardslash.minus"
    
    // MARK: GameCell Icons
    static let VERSUS_ICON = "flag.2.crossed"
    
}

struct Constraint {
    
    // MARK: App Constraints
    static let XSMALL = 8.0
    static let SMALL = 12.0
    static let MEDIUM = 16.0
    static let LARGE = 24.0
    static let XLARGE = 32.0
    static let XXLARGE = 40.0
    
    struct Height {
        
        // MARK: Height Constraints
        static let XSMALL = 20.0
        static let SMALL = 40.0
        static let MEDIUM = 60.0
        static let LARGE = 80.0
        static let XLARGE = 100.0
        static let XXLARGE = 120.0
    }
    
}
