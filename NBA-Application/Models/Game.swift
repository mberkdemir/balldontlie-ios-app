//
//  Game.swift
//  NBA-Application
//
//  Created by Berk on 3.07.2023.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    let id: Int
    let date: String
    let homeTeam: Team
    let homeTeamScore, period: Int
    let postseason: Bool
    let season: Int
    let status: String
    let time: String
    let visitorTeam: Team
    let visitorTeamScore: Int

    enum CodingKeys: String, CodingKey {
        case id, date
        case homeTeam = "home_team"
        case homeTeamScore = "home_team_score"
        case period, postseason, season, status, time
        case visitorTeam = "visitor_team"
        case visitorTeamScore = "visitor_team_score"
    }
}
