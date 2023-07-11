//
//  PlayersViewController.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import UIKit

protocol PlayersViewControllerInterface: AnyObject {
    func configurePlayersPage()
    func showErrorMessage(errorMessage: String)
    func configurePlayersCollectionView()
    func updateCollectionView()
}

final class PlayersViewController: UIViewController {
    
    private lazy var viewModel = PlayersViewModel()
    private var playersCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }

}

extension PlayersViewController: PlayersViewControllerInterface {
    func configurePlayersPage() {
        title = AppText.PLAYERS_TEXT
    }
    
    func configurePlayersCollectionView() {
        playersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createBasicListFlowLayout(height: Constraint.Height.XLARGE))
        view.addSubview(playersCollectionView)
        playersCollectionView.pinToEdgeSafeAreaLayoutGuideOf(view: view)
        playersCollectionView.backgroundColor = ColorPalette.BLACK
        playersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        playersCollectionView.dataSource = self
        playersCollectionView.delegate = self
        playersCollectionView.register(PlayerCell.self, forCellWithReuseIdentifier: PlayerCell.reuseId)
        
    }
    
    func showErrorMessage(errorMessage: String) {
        UIHelper.showAlertMessage(in: self, message: errorMessage)
    }
    
    func updateCollectionView() {
        playersCollectionView.updateCollectionViewInMainThread()
    }
}

extension PlayersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCell.reuseId, for: indexPath) as! PlayerCell
        cell.setCell(player: viewModel.players[indexPath.item])
        return cell
    }
    
    
}
