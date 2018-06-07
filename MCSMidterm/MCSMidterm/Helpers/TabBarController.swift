//
//  TabBarController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTabBar()
        
        // - FIXME:- change names for selected and unselected states
        
        let arrayOfImageNameForSelectedState = ["selectedSearch", "selectedHeart", "selectedTask"]
        let arrayOfImageNameForUnselectedState = ["searchIcon", "heartIcon", "task"]
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState = arrayOfImageNameForSelectedState[i]
                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]
                
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        let selectedColor = UIColor.limeGreen
        let unselectedColor = UIColor.black
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedColor], for: .selected)
    }
    
    
    func customTabBar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listNav = storyBoard.instantiateViewController(withIdentifier: "MyList")
        let listNavController =  UINavigationController(rootViewController: listNav)
        listNav.title = "My List"
        // list nav icon image, while selected and not selected
        
        let itemsNav = storyBoard.instantiateViewController(withIdentifier: "Items")
        let itemsNavController = UINavigationController(rootViewController: itemsNav)
        itemsNav.title = "Items"
        // items nav icon image, selected and not selected
        
        let favsNav = storyBoard.instantiateViewController(withIdentifier: "Favs")
        let favsNavController = UINavigationController(rootViewController: favsNav)
        favsNav.title = "Favorites"
        // favs nav icon image, selected and not selected
        
        /*
         searchNav.title = "Search"
         searchNav.tabBarItem.image = #imageLiteral(resourceName: "searchIcon")
         searchNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "selectedSearch")
         */
        
        viewControllers = [listNavController, itemsNavController, favsNavController]
    }
}
