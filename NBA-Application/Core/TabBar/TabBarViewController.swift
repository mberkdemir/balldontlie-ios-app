//
//  ViewController.swift
//  NBA-Application
//
//  Created by Berk on 28.06.2023.
//

import UIKit

protocol TabBarViewInterface : AnyObject {
    func setupNavBarItems()
    func configureTabBar()
    func configureUserInterfaceStyle()
}

final class TabBarViewController: UITabBarController {
    private lazy var viewModel = TabBarViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }


}

extension TabBarViewController: TabBarViewInterface {
    func setupNavBarItems() {
        let gamesScreen = GamesViewController()
        let searchScreen = PlayersViewController()
        let teamsScreen = TeamsViewController()
        
        gamesScreen.navigationItem.largeTitleDisplayMode = .always
        searchScreen.navigationItem.largeTitleDisplayMode = .always
        teamsScreen.navigationItem.largeTitleDisplayMode = .always
        
        
        let nav1 = UINavigationController(rootViewController: gamesScreen)
        let nav2 = UINavigationController(rootViewController: searchScreen)
        let nav3 = UINavigationController(rootViewController: teamsScreen)
        
        nav1.tabBarItem = UITabBarItem(title: AppText.GAMES_TEXT, image: UIImage(systemName: Icons.GAMES), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: AppText.PLAYERS_TEXT, image: UIImage(systemName: Icons.PLAYERS), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: AppText.TEAMS_TEXT, image: UIImage(systemName: Icons.TEAMS), tag: 3)
        
        let navItems = [nav1, nav2, nav3]
        
        for nav in navItems {
            nav.navigationBar.prefersLargeTitles = true
            
            nav.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorPalette.WHITE]
            nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorPalette.WHITE]
        }
        
        tabBar.barTintColor = ColorPalette.BLACK
        setViewControllers(navItems, animated: true)
    }
    
    
    func configureTabBar(){
        tabBar.tintColor = ColorPalette.ORANGE
        tabBar.unselectedItemTintColor = ColorPalette.GRAY
        tabBar.backgroundColor = ColorPalette.BLACK
    }
    
    func configureUserInterfaceStyle() {
        overrideUserInterfaceStyle = .dark
    }
    
}
