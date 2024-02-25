//
//  TabBarController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()

    }
    func setUpTabs() {
        
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house")!, and: HomeViewController())
        let category = self.createNav(with: "Category", and: UIImage(systemName: "square.grid.2x2")!, and: CategoryViewController())
        let favorite = self.createNav(with: "Favorite", and: UIImage(systemName: "heart")!, and: FavoriteViewController())
        let basket = self.createNav(with: "Basket", and: UIImage(systemName: "basket")!, and: BasketViewController())
        let setting = self.createNav(with: "More", and: UIImage(systemName: "ellipsis")!, and: SettingViewController())
        viewControllers = [home, category, favorite, basket, setting]
    }

    func createNav(with name: String, and image: UIImage, and vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = name
        nav.tabBarItem.image = image
//        UITabBar.appearance().barTintColor = UIColor.red
        return nav
    }

}
