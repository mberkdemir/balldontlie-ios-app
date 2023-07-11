//
//  TeamServices.swift
//  NBA-Application
//
//  Created by Berk on 3.07.2023.
//

import Foundation

final class TeamServices {
    
    static let shared = TeamServices()
    
    private init() { }
    
    func fetchTeams(completion: @escaping ([Team]?, String?) -> ()) {
        guard let url = URL(string: APIURLs.teams()) else { return }
        NetworkManager.shared.fetch(type: TeamFeed.self, url: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let teams):
                completion(teams.data, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
    
}
