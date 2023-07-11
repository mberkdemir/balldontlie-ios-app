//
//  PlayerCell.swift
//  NBA-Application
//
//  Created by Berk on 5.07.2023.
//

import UIKit

class PlayerCell: UICollectionViewCell {
    
    static let reuseId = "PlayerCell"
    private var playerCellLabel: PlayerCellLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureCellItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = ColorPalette.GRAY_DARK
        layer.cornerRadius = Constraint.MEDIUM
        clipsToBounds = true
    }
    
    func setCell(player: Player) {
        playerCellLabel.playerName = "\(player.firstName) \(player.lastName)"
        playerCellLabel.playerTeam = player.team.name
        playerCellLabel.playerPosition = player.position
    }
    
    func configureCellItems() {
        playerCellLabel = PlayerCellLabel()
        playerCellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(playerCellLabel)
        
        NSLayoutConstraint.activate([
            playerCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constraint.MEDIUM),
            playerCellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -(Constraint.XSMALL / 2))
        ])
    }
    
    override func prepareForReuse() {
        // TODO: Set cell for reuse
    }
}
