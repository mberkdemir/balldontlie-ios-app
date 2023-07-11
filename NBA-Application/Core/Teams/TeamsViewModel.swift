//
//  TeamsViewModel.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import Foundation


protocol TeamsViewModelInterface {
    var view: TeamsViewControllerInterface? { get set }
    func viewDidLoad()
    func showErrorMessage(errorMessage: String)
}

final class TeamsViewModel {
    weak var view: TeamsViewControllerInterface?
    var teams: [Team] = []
}

extension TeamsViewModel: TeamsViewModelInterface {
    
    func viewDidLoad() {
        view?.configureTeamsPage()
        view?.configureTeamCollectionView()
        self.fetchTeams()
    }
    
    private func fetchTeams() {
        TeamServices.shared.fetchTeams { [weak self] (teams, errorMessage) in
            guard let self = self else { return }
            if let errorMessage = errorMessage {
                self.showErrorMessage(errorMessage: errorMessage)
                return
            }
            guard let teams = teams else { return }
            
            self.teams = teams
            self.updateCollectionView()
        }
    }
    
    func showErrorMessage(errorMessage: String) {
        view?.showErrorMessage(errorMessage: errorMessage)
    }
    
    private func updateCollectionView() {
        view?.reloadCollectionView()
    }
    
}
