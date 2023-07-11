//
//  GameCellLabel.swift
//  NBA-Application
//
//  Created by Berk on 3.07.2023.
//

import UIKit

final class GameCellLabel: UILabel {
    
    var teamName: String?
    var teamScore: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        UIHelper.setDefaultFontSize(label: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constraint.SMALL
        
        let teamNameLabel = UILabel()
        teamNameLabel.text = teamName
        teamNameLabel.font = UIFont.boldSystemFont(ofSize: Constraint.MEDIUM)
        teamNameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        teamNameLabel.textColor = ColorPalette.WHITE
        stackView.addArrangedSubview(teamNameLabel)
        
        let teamScoreLabel = UILabel()
        teamScoreLabel.text = teamScore
        teamScoreLabel.font = UIFont.systemFont(ofSize: Constraint.SMALL)
        teamScoreLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        teamScoreLabel.textColor = ColorPalette.BLUE
        stackView.addArrangedSubview(teamScoreLabel)
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.pinToEdgeOf(view: self)
    }
}
