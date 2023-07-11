//
//  PlayerFeed.swift
//  NBA-Application
//
//  Created by Berk on 5.07.2023.
//

import Foundation

// MARK: - PlayerFeed
struct PlayerFeed: Codable {
    let data: [Player]
    let meta: Meta
}
