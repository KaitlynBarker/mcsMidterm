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
    
    var products: [Product] {
        let moc = CoreDataStack.context
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            return try moc.fetch(request)
        } catch let fetchError {
            debugPrint("Unable to fetch request. error: \(fetchError.localizedDescription)")
        }
        return []
    }
    
    var selectedProducts: [Product] {
        return self.products.filter({ (product) -> Bool in
            return product.isSelected == true
        })
    }
    
    func deleteProduct(product: Product) {
        product.managedObjectContext?.delete(product)
        self.save()
    }
    
    func isSelectedToggle(product: Product) {
        product.isSelected = !product.isSelected
        self.save()
    }
    
    func isPurchasedToggle(product: Product) {
        product.isPurchased = !product.isPurchased
        self.save()
    }
    
    func saveArray(array: [Product]) {
        for object in array {
            if object.isSelected == true {
                guard let entity = NSEntityDescription.entity(forEntityName: "Product", in: CoreDataStack.context) else { return }
                let product = NSManagedObject(entity: entity, insertInto: CoreDataStack.context)
                product.setValue(object.name, forKeyPath: "name")
                product.setValue(object.image, forKey: "image")
                product.setValue(object.isPurchased, forKey: "isPurchased")
                product.setValue(object.isSelected, forKey: "isSelected")
            }
        }
        self.save()
    }
    
    func save() {
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch let saveError {
            debugPrint("Unable to save product. error: \(saveError.localizedDescription)")
        }
    }
    
    func getCategoryList(completion: @escaping ([Category]) -> Void) {
        
        // MARK: - Categories
        
        var categoryList: [Category] = []
        
        let fruit = Category(name: "Fruits", image: #imageLiteral(resourceName: "fruits"), id: 1)
        let vegetables = Category(name: "Vegetables", image: #imageLiteral(resourceName: "vegetables"), id: 2)
        let meats = Category(name: "Meats", image: #imageLiteral(resourceName: "meat"), id: 3)
        let seafood = Category(name: "Seafood", image: #imageLiteral(resourceName: "seafood"), id: 4)
        let dairy = Category(name: "Dairy", image: #imageLiteral(resourceName: "dairy"), id: 5)
        let bakery = Category(name: "Bakery", image: #imageLiteral(resourceName: "bakery"), id: 6)
        let frozen = Category(name: "Frozen", image: #imageLiteral(resourceName: "frozen"), id: 7)
        let sweets = Category(name: "Sweets", image: #imageLiteral(resourceName: "sweets"), id: 8)
        let snacks = Category(name: "Snacks", image: #imageLiteral(resourceName: "snacks"), id: 9)
        let drinks = Category(name: "Drinks", image: #imageLiteral(resourceName: "drinks"), id: 10)
        let hygiene = Category(name: "Hygeine", image: #imageLiteral(resourceName: "hygeine"), id: 11)
        let pharmacy = Category(name: "Pharmacy", image: #imageLiteral(resourceName: "pharmacy"), id: 12)
        let home = Category(name: "Home", image: #imageLiteral(resourceName: "home"), id: 13)
        
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
        categoryList.append(hygiene)
        categoryList.append(pharmacy)
        categoryList.append(home)
        
        // MARK: - Fruit
        
        let apple = Product(name: "Apple", image: #imageLiteral(resourceName: "apples"), categoryID: 1)
        let banana = Product(name: "Banana", image: #imageLiteral(resourceName: "banana"), categoryID: 1)
        let blueberries = Product(name: "Blueberries", image: #imageLiteral(resourceName: "blueberries"), categoryID: 1)
        let blackberries = Product(name: "Blackberries", image: #imageLiteral(resourceName: "blackberries"), categoryID: 1)
        let cherries = Product(name: "Cherries", image: #imageLiteral(resourceName: "cherries"), categoryID: 1)
        let dragonFruit = Product(name: "Dragon Fruit", image: #imageLiteral(resourceName: "dragonfruit"), categoryID: 1)
        let grapes = Product(name: "Grapes", image: #imageLiteral(resourceName: "grapes"), categoryID: 1)
        let kiwis = Product(name: "Kiwis", image: #imageLiteral(resourceName: "kiwi"), categoryID: 1)
        let lemons = Product(name: "Lemons", image: #imageLiteral(resourceName: "lemons"), categoryID: 1)
        let limes = Product(name: "Limes", image: #imageLiteral(resourceName: "limes"), categoryID: 1)
        let oranges = Product(name: "Oranges", image: #imageLiteral(resourceName: "oranges"), categoryID: 1)
        let peaches = Product(name: "Peaches", image: #imageLiteral(resourceName: "peaches"), categoryID: 1)
        let plums = Product(name: "Plums", image: #imageLiteral(resourceName: "plums"), categoryID: 1)
        let strawberries = Product(name: "Strawberries", image: #imageLiteral(resourceName: "strawberries"), categoryID: 1)
        
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
        
        let bellPepper = Product(name: "Bell Peppers", image: #imageLiteral(resourceName: "bellPepper"), categoryID: 2)
        let brusselsSprouts = Product(name: "Brussels Sprouts", image: #imageLiteral(resourceName: "brusselsSprouts"), categoryID: 2)
        let broccoli = Product(name: "Broccoli", image: #imageLiteral(resourceName: "broccoli"), categoryID: 2)
        let carrots = Product(name: "Carrots", image: #imageLiteral(resourceName: "carrots"), categoryID: 2)
        let cucumber = Product(name: "Cucumber", image: #imageLiteral(resourceName: "cucumber"), categoryID: 2)
        let onions = Product(name: "Onions", image: #imageLiteral(resourceName: "onions"), categoryID: 2)
        let potatoes = Product(name: "Potatoes", image: #imageLiteral(resourceName: "potatoes"), categoryID: 2)
        let spinach = Product(name: "Spinach", image: #imageLiteral(resourceName: "spinach"), categoryID: 2)
        let tomatoes = Product(name: "Tomatoes", image: #imageLiteral(resourceName: "tomatoes"), categoryID: 2)
        
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
        
        let beef = Product(name: "Beef", image: #imageLiteral(resourceName: "beef"), categoryID: 3)
        let chicken = Product(name: "Chicken", image: #imageLiteral(resourceName: "chicken"), categoryID: 3)
        let lamb = Product(name: "Lamb", image: #imageLiteral(resourceName: "lamb"), categoryID: 3)
        let pork = Product(name: "Pork", image: #imageLiteral(resourceName: "pork"), categoryID: 3)
        
        meats.addToProducts(beef)
        meats.addToProducts(chicken)
        meats.addToProducts(lamb)
        meats.addToProducts(pork)
        
        // MARK: - Seafood
        
        let crab = Product(name: "Crab", image: #imageLiteral(resourceName: "crab"), categoryID: 4)
        let lobster = Product(name: "Lobster", image: #imageLiteral(resourceName: "lobster"), categoryID: 4)
        let salmon = Product(name: "Salmon", image: #imageLiteral(resourceName: "salmon"), categoryID: 4)
        let shrimp = Product(name: "Shrimp", image: #imageLiteral(resourceName: "shrimp"), categoryID: 4)
        
        seafood.addToProducts(crab)
        seafood.addToProducts(lobster)
        seafood.addToProducts(salmon)
        seafood.addToProducts(shrimp)
        
        // MARK: - Dairy
        
        let cheese = Product(name: "Cheese", image: #imageLiteral(resourceName: "cheese"), categoryID: 5)
        let milk = Product(name: "Milk", image: #imageLiteral(resourceName: "dairy"), categoryID: 5)
        let yogurt = Product(name: "Yogurt", image: #imageLiteral(resourceName: "yogurt"), categoryID: 5)
        
        dairy.addToProducts(cheese)
        dairy.addToProducts(milk)
        dairy.addToProducts(yogurt)
        
        // MARK: - Bakery
        
        let bagels = Product(name: "Bagels", image: #imageLiteral(resourceName: "bagel"), categoryID: 6)
        let bread = Product(name: "Bread", image: #imageLiteral(resourceName: "bread"), categoryID: 6)
        let brownies = Product(name: "Brownies", image: #imageLiteral(resourceName: "brownie"), categoryID: 6)
        let cake = Product(name: "Cake", image: #imageLiteral(resourceName: "cake"), categoryID: 6)
        let cookies = Product(name: "Cookies", image: #imageLiteral(resourceName: "cookies"), categoryID: 6)
        let cupcakes = Product(name: "Cupcakes", image: #imageLiteral(resourceName: "cupcakes"), categoryID: 6)
        let muffins = Product(name: "Muffins", image: #imageLiteral(resourceName: "muffins"), categoryID: 6)
        
        bakery.addToProducts(bagels)
        bakery.addToProducts(bread)
        bakery.addToProducts(brownies)
        bakery.addToProducts(cake)
        bakery.addToProducts(cookies)
        bakery.addToProducts(cupcakes)
        bakery.addToProducts(muffins)
        
        // MARK: - Frozen
        
        let iceCream = Product(name: "Ice Cream", image: #imageLiteral(resourceName: "iceCream"), categoryID: 7)
        let other = Product(name: "Other", image: #imageLiteral(resourceName: "frozen"), categoryID: 7)
        
        frozen.addToProducts(iceCream)
        frozen.addToProducts(other)
        
        // MARK: - Sweets
        
        let candy = Product(name: "Candy", image: #imageLiteral(resourceName: "sweets"), categoryID: 8)
        let chocolate = Product(name: "Chocolate", image: #imageLiteral(resourceName: "chocolate"), categoryID: 8)
        let doughnut = Product(name: "Doughnut", image: #imageLiteral(resourceName: "doughnut"), categoryID: 8)
        let marzipan = Product(name: "Marzipan", image: #imageLiteral(resourceName: "marzipan"), categoryID: 8)
        
        sweets.addToProducts(candy)
        sweets.addToProducts(chocolate)
        sweets.addToProducts(doughnut)
        sweets.addToProducts(marzipan)
        
        // MARK: - Snacks
        
        let chips = Product(name: "Chips", image: #imageLiteral(resourceName: "snacks"), categoryID: 9)
        let crackers = Product(name: "Crackers", image: #imageLiteral(resourceName: "crackers"), categoryID: 9)
        let hummus = Product(name: "Hummus", image: #imageLiteral(resourceName: "hummus"), categoryID: 9)
        let snackMix = Product(name: "Snack Mix", image: #imageLiteral(resourceName: "snackMix"), categoryID: 9)
        
        snacks.addToProducts(chips)
        snacks.addToProducts(crackers)
        snacks.addToProducts(hummus)
        snacks.addToProducts(snackMix)
        
        // MARK: - Drinks
        
        let coffee = Product(name: "Coffee", image: #imageLiteral(resourceName: "coffee"), categoryID: 10)
        let energyDrinks = Product(name: "Energy Drinks", image: #imageLiteral(resourceName: "energyDrink"), categoryID: 10)
        let juice = Product(name: "Juice", image: #imageLiteral(resourceName: "juice"), categoryID: 10)
        let soda = Product(name: "Soda", image: #imageLiteral(resourceName: "soda"), categoryID: 10)
        let smoothie = Product(name: "Smoothie", image: #imageLiteral(resourceName: "smoothie"), categoryID: 10)
        let tea = Product(name: "Tea", image: #imageLiteral(resourceName: "tea"), categoryID: 10)
        
        drinks.addToProducts(coffee)
        drinks.addToProducts(energyDrinks)
        drinks.addToProducts(juice)
        drinks.addToProducts(soda)
        drinks.addToProducts(smoothie)
        drinks.addToProducts(tea)
        
        // MARK: - Hygiene
        
        let deodorant = Product(name: "Deodorant", image: #imageLiteral(resourceName: "deodorant"), categoryID: 11)
        let mouthwash = Product(name: "Mouthwash", image: #imageLiteral(resourceName: "mouthwash"), categoryID: 11)
        let shampooConditioner = Product(name: "Shampoo/Conditioner", image: #imageLiteral(resourceName: "shampoo-conditioner"), categoryID: 11)
        let soap = Product(name: "Soap", image: #imageLiteral(resourceName: "soap"), categoryID: 11)
        let oralCare = Product(name: "Toothbrush/Toothpaste", image: #imageLiteral(resourceName: "oralCare"), categoryID: 11)
        
        hygiene.addToProducts(deodorant)
        hygiene.addToProducts(mouthwash)
        hygiene.addToProducts(shampooConditioner)
        hygiene.addToProducts(soap)
        hygiene.addToProducts(oralCare)
        
        // MARK: - Pharmacy
        
        let bandaids = Product(name: "Band-Aids", image: #imageLiteral(resourceName: "band-aid"), categoryID: 12)
        let medication = Product(name: "Medication", image: #imageLiteral(resourceName: "pharmacy"), categoryID: 12)
        
        pharmacy.addToProducts(bandaids)
        pharmacy.addToProducts(medication)
        
        // MARK: - Home
        
        let broomMop = Product(name: "Broom/Mop", image: #imageLiteral(resourceName: "broom-mop"), categoryID: 13)
        let dishwasherSoap = Product(name: "Dish Soap", image: #imageLiteral(resourceName: "dishSoap"), categoryID: 13)
        let laundrySupplies = Product(name: "Laundry Supplies", image: #imageLiteral(resourceName: "laundrySupplies"), categoryID: 13)
        let vacuum = Product(name: "Vacuum", image: #imageLiteral(resourceName: "vacuum"), categoryID: 13)
        
        home.addToProducts(broomMop)
        home.addToProducts(dishwasherSoap)
        home.addToProducts(laundrySupplies)
        home.addToProducts(vacuum)
        
        completion(categoryList)
    }
}
