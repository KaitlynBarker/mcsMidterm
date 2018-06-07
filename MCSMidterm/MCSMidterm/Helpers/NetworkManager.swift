//
//  NetworkManager.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class NetworkManager {
    
    func getCategoryList(completion: @escaping ([Category]) -> Void) {
        // MARK: - Categories
        
        var categoryList: [Category] = []
        
        let fruit = Category(name: "Fruits", image: #imageLiteral(resourceName: "fruits"))
        let vegetables = Category(name: "Vegetables", image: #imageLiteral(resourceName: "vegetables"))
        let meats = Category(name: "Meats", image: #imageLiteral(resourceName: "meat"))
        let seafood = Category(name: "Seafood", image: #imageLiteral(resourceName: "seafood"))
        let dairy = Category(name: "Dairy", image: #imageLiteral(resourceName: "dairy"))
        let bakery = Category(name: "Bakery", image: #imageLiteral(resourceName: "bakery"))
        let frozen = Category(name: "Frozen", image: #imageLiteral(resourceName: "frozen"))
        let sweets = Category(name: "Sweets", image: #imageLiteral(resourceName: "sweets"))
        let snacks = Category(name: "Snacks", image: #imageLiteral(resourceName: "snacks"))
        let drinks = Category(name: "Drinks", image: #imageLiteral(resourceName: "drinks"))
        let baby = Category(name: "Baby", image: #imageLiteral(resourceName: "baby"))
        let hygiene = Category(name: "Hygeine", image: #imageLiteral(resourceName: "hygeine"))
        let pharmacy = Category(name: "Pharmacy", image: #imageLiteral(resourceName: "pharmacy"))
        let home = Category(name: "Home", image: #imageLiteral(resourceName: "home"))
        
        categoryList.append(fruit)
        categoryList.append(vegetables)
        categoryList.append(meats)
        categoryList.append(seafood)
        categoryList.append(dairy)
        categoryList.append(bakery)
        categoryList.append(frozen)
        categoryList.append(sweets)
        categoryList.append(snacks)
        categoryList.append(drinks)
        categoryList.append(baby)
        categoryList.append(hygiene)
        categoryList.append(pharmacy)
        categoryList.append(home)
        
        // MARK: - Fruit
        
        let apple = Product(name: "Apple", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "apples"))
        let banana = Product(name: "Banana", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "banana"))
        let blueberries = Product(name: "Blueberries", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "blueberries"))
        let blackberries = Product(name: "Blackberries", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "blackberries"))
        let cherries = Product(name: "Cherries", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "cherries"))
        let dragonFruit = Product(name: "Dragon Fruit", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "dragonfruit"))
        let grapes = Product(name: "Grapes", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "grapes"))
        let kiwis = Product(name: "Kiwis", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "kiwi"))
        let lemons = Product(name: "Lemons", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "lemons"))
        let limes = Product(name: "Limes", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "limes"))
        let oranges = Product(name: "Oranges", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "oranges"))
        let peaches = Product(name: "Peaches", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "peaches"))
        let plums = Product(name: "Plums", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "plums"))
        let strawberries = Product(name: "Strawberries", isPurchased: false, isSelected: false, image: #imageLiteral(resourceName: "strawberries"))
        
        fruit.addToProducts(apple)
        fruit.addToProducts(banana)
        fruit.addToProducts(blueberries)
        fruit.addToProducts(blackberries)
        fruit.addToProducts(cherries)
        fruit.addToProducts(dragonFruit)
        fruit.addToProducts(grapes)
        fruit.addToProducts(kiwis)
        fruit.addToProducts(lemons)
        fruit.addToProducts(limes)
        fruit.addToProducts(oranges)
        fruit.addToProducts(peaches)
        fruit.addToProducts(plums)
        fruit.addToProducts(strawberries)
        
        // MARK: - Vegetables
        
        // MARK: - Meat
        
        // MARK: - Seafood
        
        // MARK: - Dairy
        
        // MARK: - Bakery
        
        // MARK: - Frozen
        
        // MARK: - Sweets
        
        // MARK: - Snacks
        
        // MARK: - Drinks
        
        // MARK: - Baby
        
        // MARK: - Hygiene
        
        // MARK: - Pharmacy
        
        // MARK: - Home
    }
}
