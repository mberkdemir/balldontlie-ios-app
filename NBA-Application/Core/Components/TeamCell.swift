//
//  TeamCell.swift
//  NBA-Application
//
//  Created by Berk on 3.07.2023.
//

import UIKit

final class TeamCell: UICollectionViewCell {
    
    static let reuseId = "TeamCell"
    
    private var teamLabel: TeamCellLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCell()
        self.configureCellItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = ColorPalette.GRAY_DARK
        layer.cornerRadius = Constraint.MEDIUM
        clipsToBounds = true
    }
    
    func configureCellItems() {
        teamLabel = TeamCellLabel()
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(teamLabel)
        
        contentView.backgroundColor = ColorPalette.GRAY_DARK
        
        
        NSLayoutConstraint.activate([
            teamLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constraint.MEDIUM),
            teamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -(Constraint.XSMALL / 2))
        ])
    }
    
    func setCell(team: Team) {
        teamLabel.name = team.name
        teamLabel.fullName = team.fullName
        teamLabel.abbreviation = team.abbreviation
    }
    
    override func prepareForReuse() {
        teamLabel.name = nil
        teamLabel.fullName = nil
        teamLabel.abbreviation = nil
    }
    
    
}
