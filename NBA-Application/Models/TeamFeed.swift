//
//  TeamFeed.swift
//  NBA-Application
//
//  Created by Berk on 3.07.2023.
//

import Foundation

// MARK: - TeamFeed
struct TeamFeed: Codable {
    let data: [Team]
    let meta: Meta
}
