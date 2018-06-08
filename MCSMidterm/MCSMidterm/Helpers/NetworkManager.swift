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
    
    static let shared = NetworkManager()
    
    private init() {}
    
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
        
        let apple = Product(name: "Apple", image: #imageLiteral(resourceName: "apples"))
        let banana = Product(name: "Banana", image: #imageLiteral(resourceName: "banana"))
        let blueberries = Product(name: "Blueberries", image: #imageLiteral(resourceName: "blueberries"))
        let blackberries = Product(name: "Blackberries", image: #imageLiteral(resourceName: "blackberries"))
        let cherries = Product(name: "Cherries", image: #imageLiteral(resourceName: "cherries"))
        let dragonFruit = Product(name: "Dragon Fruit", image: #imageLiteral(resourceName: "dragonfruit"))
        let grapes = Product(name: "Grapes", image: #imageLiteral(resourceName: "grapes"))
        let kiwis = Product(name: "Kiwis", image: #imageLiteral(resourceName: "kiwi"))
        let lemons = Product(name: "Lemons", image: #imageLiteral(resourceName: "lemons"))
        let limes = Product(name: "Limes", image: #imageLiteral(resourceName: "limes"))
        let oranges = Product(name: "Oranges", image: #imageLiteral(resourceName: "oranges"))
        let peaches = Product(name: "Peaches", image: #imageLiteral(resourceName: "peaches"))
        let plums = Product(name: "Plums", image: #imageLiteral(resourceName: "plums"))
        let strawberries = Product(name: "Strawberries", image: #imageLiteral(resourceName: "strawberries"))
        
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
        
        let bellPepper = Product(name: "Bell Peppers", image: #imageLiteral(resourceName: "bellPepper"))
        let brusselsSprouts = Product(name: "Brussels Sprouts", image: #imageLiteral(resourceName: "brusselsSprouts"))
        let broccoli = Product(name: "Broccoli", image: #imageLiteral(resourceName: "broccoli"))
        let carrots = Product(name: "Carrots", image: #imageLiteral(resourceName: "carrots"))
        let cucumber = Product(name: "Cucumber", image: #imageLiteral(resourceName: "cucumber"))
        let onions = Product(name: "Onions", image: #imageLiteral(resourceName: "onions"))
        let potatoes = Product(name: "Potatoes", image: #imageLiteral(resourceName: "potatoes"))
        let spinach = Product(name: "Spinach", image: #imageLiteral(resourceName: "spinach"))
        let tomatoes = Product(name: "Tomatoes", image: #imageLiteral(resourceName: "tomatoes"))
        
        vegetables.addToProducts(bellPepper)
        vegetables.addToProducts(brusselsSprouts)
        vegetables.addToProducts(broccoli)
        vegetables.addToProducts(carrots)
        vegetables.addToProducts(cucumber)
        vegetables.addToProducts(onions)
        vegetables.addToProducts(potatoes)
        vegetables.addToProducts(spinach)
        vegetables.addToProducts(tomatoes)
        
        // MARK: - Meat
        
        let beef = Product(name: "Beef", image: #imageLiteral(resourceName: "beef"))
        let chicken = Product(name: "Chicken", image: #imageLiteral(resourceName: "chicken"))
        let lamb = Product(name: "Lamb", image: #imageLiteral(resourceName: "lamb"))
        let pork = Product(name: "Pork", image: #imageLiteral(resourceName: "pork"))
        
        meats.addToProducts(beef)
        meats.addToProducts(chicken)
        meats.addToProducts(lamb)
        meats.addToProducts(pork)
        
        // MARK: - Seafood
        
        let crab = Product(name: "Crab", image: #imageLiteral(resourceName: "crab"))
        let lobster = Product(name: "Lobster", image: #imageLiteral(resourceName: "lobster"))
        let salmon = Product(name: "Salmon", image: #imageLiteral(resourceName: "salmon"))
        let shrimp = Product(name: "Shrimp", image: #imageLiteral(resourceName: "shrimp"))
        
        seafood.addToProducts(crab)
        seafood.addToProducts(lobster)
        seafood.addToProducts(salmon)
        seafood.addToProducts(shrimp)
        
        // MARK: - Dairy
        
        let cheese = Product(name: "Cheese", image: #imageLiteral(resourceName: "cheese"))
        let milk = Product(name: "Milk", image: #imageLiteral(resourceName: "dairy"))
        let yogurt = Product(name: "Yogurt", image: #imageLiteral(resourceName: "yogurt"))
        
        dairy.addToProducts(cheese)
        dairy.addToProducts(milk)
        dairy.addToProducts(yogurt)
        
        // MARK: - Bakery
        
        let bagels = Product(name: "Bagels", image: #imageLiteral(resourceName: "bagel"))
        let bread = Product(name: "Bread", image: #imageLiteral(resourceName: "bread"))
        let brownies = Product(name: "Brownies", image: #imageLiteral(resourceName: "brownie"))
        let cake = Product(name: "Cake", image: #imageLiteral(resourceName: "cake"))
        let cookies = Product(name: "Cookies", image: #imageLiteral(resourceName: "cookies"))
        let cupcakes = Product(name: "Cupcakes", image: #imageLiteral(resourceName: "cupcakes"))
        let muffins = Product(name: "Muffins", image: #imageLiteral(resourceName: "muffins"))
        
        bakery.addToProducts(bagels)
        bakery.addToProducts(bread)
        bakery.addToProducts(brownies)
        bakery.addToProducts(cake)
        bakery.addToProducts(cookies)
        bakery.addToProducts(cupcakes)
        bakery.addToProducts(muffins)
        
        // MARK: - Frozen
        
        let iceCream = Product(name: "Ice Cream", image: #imageLiteral(resourceName: "iceCream"))
        let other = Product(name: "Other", image: #imageLiteral(resourceName: "frozen"))
        
        frozen.addToProducts(iceCream)
        frozen.addToProducts(other)
        
        // MARK: - Sweets
        
        let candy = Product(name: "Candy", image: #imageLiteral(resourceName: "sweets"))
        let chocolate = Product(name: "Chocolate", image: #imageLiteral(resourceName: "chocolate"))
        let doughnut = Product(name: "Doughnut", image: #imageLiteral(resourceName: "doughnut"))
        let marzipan = Product(name: "Marzipan", image: #imageLiteral(resourceName: "marzipan"))
        
        sweets.addToProducts(candy)
        sweets.addToProducts(chocolate)
        sweets.addToProducts(doughnut)
        sweets.addToProducts(marzipan)
        
        // MARK: - Snacks
        
        let chips = Product(name: "Chips", image: #imageLiteral(resourceName: "snacks"))
        let crackers = Product(name: "Crackers", image: #imageLiteral(resourceName: "crackers"))
        let hummus = Product(name: "Hummus", image: #imageLiteral(resourceName: "hummus"))
        let snackMix = Product(name: "Snack Mix", image: #imageLiteral(resourceName: "snackMix"))
        
        snacks.addToProducts(chips)
        snacks.addToProducts(crackers)
        snacks.addToProducts(hummus)
        snacks.addToProducts(snackMix)
        
        // MARK: - Drinks
        
        /*
         Coffee
         Energy Drinks
         Horchata
         Juice
         Soda
         Smoothie
         Sports Drinks
         Tea
        */
        
        // MARK: - Baby
        
        /*
         Baby Food
         Clothing
         Diapers
         Formula
         Miscellaneous
        */
        
        // MARK: - Hygiene
        
        /*
         Body Wash
         Conditioner
         Deodorant
         Mouthwash
         Shampoo
         Soap
         Toothbrush
         Toothpaste
        */
        
        // MARK: - Pharmacy
        
        /*
         Bandaids
         Medication
         Vitamins
        */
        
        // MARK: - Home
        
        /*
         Broom
         Dishes
         Dishwasher Soap
         Dryer Sheets
         Laundry Detergent
         Mop
         Vacuum
        */
        
        completion(categoryList)
    }
}
