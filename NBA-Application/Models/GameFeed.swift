//
//  GameFeed.swift
//  NBA-Application
//
//  Created by Berk on 30.06.2023.
//

import Foundation

// MARK: - GameFeed
struct GameFeed: Codable {
    let data: [Game]
    let meta: Meta
}
