//
//  HomepageViewController.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import UIKit

protocol GamesViewControllerInterface: AnyObject {
    func configureGamesPage()
    func configureGameFeedCollectionView()
    func showErrorMessage(message: String)
    func reloadCollectionView()
}

final class GamesViewController: UIViewController {
    
    private lazy var viewModel = GamesViewModel()
    
    private var gameFeedCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
}

extension GamesViewController: GamesViewControllerInterface {
    
    func configureGamesPage() {
        self.title = AppText.GAMES_TEXT
    }
    
    func configureGameFeedCollectionView() {
        gameFeedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createBasicListFlowLayout(height: Constraint.Height.XXLARGE))
        view.addSubview(gameFeedCollectionView)
        
        gameFeedCollectionView.pinToEdgeSafeAreaLayoutGuideOf(view: view)
        
        gameFeedCollectionView.backgroundColor = ColorPalette.BLACK
        gameFeedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        gameFeedCollectionView.delegate = self
        gameFeedCollectionView.dataSource = self
        gameFeedCollectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.reuseId)
        
    }
    
    func showErrorMessage(message: String) {
        UIHelper.showAlertMessage(in: self, message: message)
    }
    
    func reloadCollectionView() {
        self.gameFeedCollectionView.updateCollectionViewInMainThread()
    }
}

extension GamesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.reuseId, for: indexPath) as! GameCell
        cell.setCell(game: viewModel.games[indexPath.item])
        
        return cell
    }
    
}
