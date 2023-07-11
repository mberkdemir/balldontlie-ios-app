//
//  Team.swift
//  NBA-Application
//
//  Created by Berk on 1.07.2023.
//

import Foundation

// MARK: - Team
struct Team: Codable {
    let id: Int
    let abbreviation, city: String
    let conference: String
    let division: String
    let fullName, name: String

    enum CodingKeys: String, CodingKey {
        case id, abbreviation, city, conference, division
        case fullName = "full_name"
        case name
    }
}
