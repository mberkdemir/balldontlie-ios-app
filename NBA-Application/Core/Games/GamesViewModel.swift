//
//  GamesViewModel.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import Foundation

protocol GamesViewModelInterface {
    var view: GamesViewControllerInterface? { get set }

    func viewDidLoad()
    func showErrorMessage(errorMessage: String)
}

final class GamesViewModel {
    weak var view: GamesViewControllerInterface?
    var games: [Game] = []
    var seasonYear: Int = 2022
}

extension GamesViewModel: GamesViewModelInterface {
    
    func viewDidLoad() {
        view?.configureGamesPage()
        view?.configureGameFeedCollectionView()
        fecthGameFeed()
    }
    
    func fecthGameFeed(){
        GameServices.shared.fetchGames { [weak self] (games, errorMessage) in
            guard let self = self else { return }
            if let errorMessage = errorMessage {
                self.showErrorMessage(errorMessage: errorMessage)
                return
            }
            guard let games = games else { return }
            
            self.games = games
            self.updateCollectionView()
        }
    }
    
    func showErrorMessage(errorMessage: String) {
        view?.showErrorMessage(message: errorMessage)
    }
    
    private func updateCollectionView() {
        view?.reloadCollectionView()
    }
    
}
