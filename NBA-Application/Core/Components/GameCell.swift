//
//  GameCell.swift
//  NBA-Application
//
//  Created by Berk on 2.07.2023.
//

import UIKit

final class GameCell: UICollectionViewCell {
    
    static let reuseId = "GameCell"
    
    private var homeTeamLabel: GameCellLabel!
    private var visitorTeamLabel: GameCellLabel!
    private var versusIcon: UIImageView!
    private var dateLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCell()
        self.configureCellItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = ColorPalette.GRAY_DARK
        layer.cornerRadius = Constraint.MEDIUM
        clipsToBounds = true
    }
    
    private func configureCellItems() {
        let gameVersusStackView = UIStackView(frame: .zero)
        addSubview(gameVersusStackView)
        gameVersusStackView.translatesAutoresizingMaskIntoConstraints = false
        gameVersusStackView.axis = .horizontal
        gameVersusStackView.alignment = .center
        gameVersusStackView.distribution = .fillEqually
        gameVersusStackView.spacing = Constraint.XXLARGE
        
        gameVersusStackView.pinToCenterOf(view: self)
        
        NSLayoutConstraint.activate([
            gameVersusStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constraint.XXLARGE),
            gameVersusStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constraint.XXLARGE)
        ])
        
        homeTeamLabel = GameCellLabel(frame: .zero)
        
        
        visitorTeamLabel = GameCellLabel(frame: .zero)
        
        
        versusIcon = UIImageView(frame: .zero)
        versusIcon.image = UIImage(systemName: Icons.VERSUS_ICON)
        versusIcon.contentMode = .scaleAspectFit
        versusIcon.tintColor = ColorPalette.RED
        
        gameVersusStackView.addArrangedSubview(homeTeamLabel)
        gameVersusStackView.addArrangedSubview(versusIcon)
        gameVersusStackView.addArrangedSubview(visitorTeamLabel)
        
        dateLabel = UILabel()
        dateLabel.textColor = ColorPalette.GRAY
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: gameVersusStackView.bottomAnchor, constant: Constraint.SMALL)
        ])
    }
    
    func setCell(game: Game) {
        homeTeamLabel.teamName = game.homeTeam.name
        homeTeamLabel.teamScore = String(game.homeTeamScore)
        visitorTeamLabel.teamName = game.visitorTeam.name
        visitorTeamLabel.teamScore = String(game.visitorTeamScore)
        
        dateLabel.text = game.date.components(separatedBy: "T")[0]
    }
    
    override func prepareForReuse() {
        homeTeamLabel.teamName = nil
        homeTeamLabel.teamScore = nil
        visitorTeamLabel.teamName = nil
        visitorTeamLabel.teamScore = nil
        
        dateLabel.text = nil
    }
}
