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

    }
    func setUpTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "film")!, and: HomeViewController())
        let category = self.createNav(with: "People", and: UIImage(systemName: "person.fill")!, and: CategoryViewController())
        let favorite = self.createNav(with: "Login", and: UIImage(systemName: "person.crop.circle")!, and: FavoriteViewController())
        let basket = self.createNav(with: "Login", and: UIImage(systemName: "person.crop.circle")!, and: BasketViewController())
        let setting = self.createNav(with: "Login", and: UIImage(systemName: "person.crop.circle")!, and: SettingViewController())
        viewControllers = [home, category, favorite, basket, setting]
    }

    func createNav(with name: String, and image: UIImage, and vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = name
        nav.tabBarItem.image = image
        return nav
    }

}
