//
//  APIURLs.swift
//  NBA-Application
//
//  Created by Berk on 1.07.2023.
//

import Foundation

enum APIURLs {
    static func games(season: Int = 2022) -> String {
        return "https://www.balldontlie.io/api/v1/games?seasons[]=\(season)"
    }
    
    static func teams() -> String {
        return "https://www.balldontlie.io/api/v1/teams"
    }
    
    static func players() -> String {
        return "https://www.balldontlie.io/api/v1/players"
    }
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidUrl = "Invalid Url"
    case generalError = "An Error Occured"
}
