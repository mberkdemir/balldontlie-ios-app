//
//  StatsViewController.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import UIKit

protocol StatsViewControllerInterface: AnyObject {
    func configureStatsPage()
}

class StatsViewController: UIViewController {
    
    private lazy var viewModel = StatsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension StatsViewController: StatsViewControllerInterface {
    
    func configureStatsPage() {
        title = AppText.STATS_TEXT
    }
}
