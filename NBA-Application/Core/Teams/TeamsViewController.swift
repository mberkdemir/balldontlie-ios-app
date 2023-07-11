//
//  TeamsViewController.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import UIKit

protocol TeamsViewControllerInterface: AnyObject {
    func configureTeamsPage()
    func configureTeamCollectionView()
    func reloadCollectionView()
    func showErrorMessage(errorMessage: String)
}

final class TeamsViewController: UIViewController {
    private lazy var viewModel = TeamsViewModel()

    private var teamCollectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }

}

extension TeamsViewController: TeamsViewControllerInterface {
    
    func configureTeamsPage() {
        title = AppText.TEAMS_TEXT
    }
    
    func configureTeamCollectionView() {
        teamCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createBasicListFlowLayout(height: Constraint.Height.LARGE))
        view.addSubview(teamCollectionView)
        teamCollectionView.pinToEdgeSafeAreaLayoutGuideOf(view: view)
        teamCollectionView.backgroundColor = ColorPalette.BLACK
        teamCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        teamCollectionView.dataSource = self
        teamCollectionView.delegate = self
        teamCollectionView.register(TeamCell.self, forCellWithReuseIdentifier: TeamCell.reuseId)
        
    }
    
    func reloadCollectionView() {
        self.teamCollectionView.updateCollectionViewInMainThread()
    }
    
    func showErrorMessage(errorMessage: String) {
        UIHelper.showAlertMessage(in: self, message: errorMessage)
    }
}

extension TeamsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: TeamCell.reuseId, for: indexPath) as! TeamCell
        cell.setCell(team: viewModel.teams[indexPath.item])
        return cell
    }

}


