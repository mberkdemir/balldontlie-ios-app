//
//  PlayersViewModel.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import Foundation

protocol PlayersViewModelInterface {
    var view: PlayersViewControllerInterface? { get set }
    func viewDidLoad()
}

final class PlayersViewModel {
    weak var view: PlayersViewControllerInterface?
    var players: [Player] = []
}

extension PlayersViewModel: PlayersViewModelInterface {
    func viewDidLoad() {
        view?.configurePlayersPage()
        view?.configurePlayersCollectionView()
        fetchPlayers()
    }
    
    func fetchPlayers() {
        PlayerServices.shared.fetchPlayers { [weak self] (players, errorMessage) in
            guard let self = self else { return }
            if let errorMessage = errorMessage {
                self.showErrorMessage(errorMessage: errorMessage)
                return
            }
            guard let players = players else { return }
            
            self.players = players
            self.updateCollectionView()
        }
    }
    
    private func showErrorMessage(errorMessage: String) {
        view?.showErrorMessage(errorMessage: errorMessage)
    }
    
    private func updateCollectionView() {
        view?.updateCollectionView()
    }
    
}
