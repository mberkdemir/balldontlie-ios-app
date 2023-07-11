//
//  TabBarViewModel.swift
//  NBA-Application
//
//  Created by Berk on 28.06.2023.
//

import Foundation

protocol TabBarViewModelInterface {
    var view: TabBarViewInterface? { get set }
    
    func viewDidLoad()
}

final class TabBarViewModel {
    weak var view: TabBarViewInterface?
}

extension TabBarViewModel: TabBarViewModelInterface {
    
    func viewDidLoad() {
        view?.setupNavBarItems()
        view?.configureTabBar()
        view?.configureUserInterfaceStyle()
    }
    
}
