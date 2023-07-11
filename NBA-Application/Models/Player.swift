//
//  Player.swift
//  NBA-Application
//
//  Created by Berk on 5.07.2023.
//

import Foundation

// MARK: - Player
struct Player: Codable {
    let id: Int
    let firstName, lastName, position: String
    let heightFeet, heightInches, weightPounds: Int?
    let team: Team

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
        case weightPounds = "weight_pounds"
        case team
    }
}
