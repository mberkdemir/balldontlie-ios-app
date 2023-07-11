//
//  TeamCellLabel.swift
//  NBA-Application
//
//  Created by Berk on 4.07.2023.
//

import UIKit

final class TeamCellLabel: UILabel {
    
    var abbreviation: String?
    var fullName: String?
    var name: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        UIHelper.setDefaultFontSize(label: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let fullNameLabel = UILabel()
        fullNameLabel.text = fullName
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: Constraint.MEDIUM)
        addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let abbreviationLabel = UILabel()
        abbreviationLabel.text = abbreviation
        abbreviationLabel.textColor = ColorPalette.YELLOW
        addSubview(abbreviationLabel)
        abbreviationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.textColor = ColorPalette.GRAY
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            fullNameLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            abbreviationLabel.leadingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: Constraint.MEDIUM),
            abbreviationLabel.centerYAnchor.constraint(equalTo: fullNameLabel.centerYAnchor),
            nameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: Constraint.XSMALL),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
    }
}
