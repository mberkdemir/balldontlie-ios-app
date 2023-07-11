//
//  PlayerServices.swift
//  NBA-Application
//
//  Created by Berk on 5.07.2023.
//

import Foundation

final class PlayerServices {
    
    static let shared = PlayerServices()
    private init() { }
    
    func fetchPlayers(completion: @escaping ([Player]?, String?) -> ()) {
        guard let url = URL(string: APIURLs.players()) else { return }
        NetworkManager.shared.fetch(type: PlayerFeed.self, url: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let players):
                completion(players.data, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
}
