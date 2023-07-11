//
//  GameServices.swift
//  NBA-Application
//
//  Created by Berk on 1.07.2023.
//

import Foundation

final class GameServices {
    
    static let shared = GameServices()
    
    private init() { }
    
    func fetchGames(completion: @escaping ([Game]?, String?) -> ()) {
        guard let url = URL(string: APIURLs.games()) else { return }
        NetworkManager.shared.fetch(type: GameFeed.self, url: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let games):
                completion(games.data, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
    
}
