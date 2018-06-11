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
        
        let arrayOfImageNameForSelectedState = ["selectedList", "selectedCart"]
        let arrayOfImageNameForUnselectedState = ["list", "cart"]
        
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
        listNav.tabBarItem.image = #imageLiteral(resourceName: "list")
        listNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "selectedList") 
        
        let itemsNav = storyBoard.instantiateViewController(withIdentifier: "Items")
        let itemsNavController = UINavigationController(rootViewController: itemsNav)
        itemsNav.title = "Items"
        itemsNav.tabBarItem.image = #imageLiteral(resourceName: "cart")
        itemsNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "selectedCart")
        
        viewControllers = [listNavController, itemsNavController]
    }
}
