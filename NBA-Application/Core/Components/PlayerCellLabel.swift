//
//  PlayerCellLabel.swift
//  NBA-Application
//
//  Created by Berk on 5.07.2023.
//

import UIKit

class PlayerCellLabel: UILabel {
    
    var playerName: String?
    var playerTeam: String?
    var playerPosition: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        UIHelper.setDefaultFontSize(label: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        let playerNameLabel = UILabel()
        playerNameLabel.text = playerName
        playerNameLabel.textColor = ColorPalette.WHITE
        playerNameLabel.font = UIFont.boldSystemFont(ofSize: Constraint.LARGE)
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(playerNameLabel)
        
        
        let playerTeamLabel = UILabel()
        playerTeamLabel.text = playerTeam
        playerTeamLabel.textColor = ColorPalette.GREEN
        playerTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(playerTeamLabel)
        
        let playerPositionLabel = UILabel()
        playerPositionLabel.text = playerPosition
        playerPositionLabel.textColor = ColorPalette.GREEN
        playerPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(playerPositionLabel)
        
        let separator = UIView()
        separator.backgroundColor = ColorPalette.GRAY
        separator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            playerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            playerNameLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            playerTeamLabel.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: Constraint.XSMALL),
            playerTeamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separator.heightAnchor.constraint(equalToConstant: Constraint.MEDIUM),
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.trailingAnchor.constraint(equalTo: playerTeamLabel.trailingAnchor, constant: Constraint.MEDIUM),
            separator.centerYAnchor.constraint(equalTo: playerTeamLabel.centerYAnchor),
            playerPositionLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: Constraint.MEDIUM),
            playerPositionLabel.centerYAnchor.constraint(equalTo: separator.centerYAnchor)
        ])
    }
}
