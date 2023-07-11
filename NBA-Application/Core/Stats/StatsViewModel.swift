//
//  StatsViewModel.swift
//  NBA-Application
//
//  Created by Berk on 29.06.2023.
//

import Foundation

protocol StatsViewModelInterface {
    var view: StatsViewControllerInterface? { get set }
    func viewDidLoad()
}

class StatsViewModel {
    weak var view: StatsViewControllerInterface? 
}

extension StatsViewModel: StatsViewModelInterface {
    func viewDidLoad() {
        view?.configureStatsPage()
    }
}
