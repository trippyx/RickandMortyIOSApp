//
//  ViewController.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import UIKit

/// Controller to House tabs and root tab controllers 
final class RMTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUptabs()
    }
    
    private func setUptabs(){
        let characterVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodesViewController()
        let settingsVC = RMSettingsViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController:episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        for nav in [nav1,nav2,nav3,nav4]{
            nav.navigationBar.prefersLargeTitles = true
        }
        
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([nav1,nav2,nav3,nav4],
                           animated: true)
    }
}

