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
    
    var products: [ProductCD] {
        let moc = CoreDataStack.context
        let request: NSFetchRequest<ProductCD> = ProductCD.fetchRequest()
        
        do {
            return try moc.fetch(request)
        } catch let fetchError {
            debugPrint("Unable to fetch request. error: \(fetchError.localizedDescription)")
        }
        return []
    }
    
    func deleteProduct(product: ProductCD) {
        product.managedObjectContext?.delete(product)
        self.save()
    }
    
    func isSelectedToggle(product: Product) {
        product.isSelected = !product.isSelected
    }
    
    func isPurchasedToggle(product: ProductCD) {
        product.isPurchased = !product.isPurchased
    }
    
    func saveArray(array: [Product]) {
        for object in array {
            if object.isSelected == true {
                guard let entity = NSEntityDescription.entity(forEntityName: "ProductCD", in: CoreDataStack.context) else { return }
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
        
        var categoryList: [Category] = []
        
        // MARK: - Fruit
        
        var fruitProducts: [Product] = []
        
        fruitProducts.append(Product(name: "Apple", image: #imageLiteral(resourceName: "apples"), categoryID: 1))
        fruitProducts.append(Product(name: "Banana", image: #imageLiteral(resourceName: "banana"), categoryID: 1))
        fruitProducts.append(Product(name: "Blueberries", image: #imageLiteral(resourceName: "blueberries"), categoryID: 1))
        fruitProducts.append(Product(name: "Blackberries", image: #imageLiteral(resourceName: "blackberries"), categoryID: 1))
        fruitProducts.append(Product(name: "Cherries", image: #imageLiteral(resourceName: "cherries"), categoryID: 1))
        fruitProducts.append(Product(name: "Dragon Fruit", image: #imageLiteral(resourceName: "dragonfruit"), categoryID: 1))
        fruitProducts.append(Product(name: "Grapes", image: #imageLiteral(resourceName: "grapes"), categoryID: 1))
        fruitProducts.append(Product(name: "Kiwis", image: #imageLiteral(resourceName: "kiwi"), categoryID: 1))
        fruitProducts.append(Product(name: "Lemons", image: #imageLiteral(resourceName: "lemons"), categoryID: 1))
        fruitProducts.append(Product(name: "Limes", image: #imageLiteral(resourceName: "limes"), categoryID: 1))
        fruitProducts.append(Product(name: "Oranges", image: #imageLiteral(resourceName: "oranges"), categoryID: 1))
        fruitProducts.append(Product(name: "Peaches", image: #imageLiteral(resourceName: "peaches"), categoryID: 1))
        fruitProducts.append(Product(name: "Plums", image: #imageLiteral(resourceName: "plums"), categoryID: 1))
        fruitProducts.append(Product(name: "Strawberries", image: #imageLiteral(resourceName: "strawberries"), categoryID: 1))
        
        let fruit = Category(name: "Fruits", image: #imageLiteral(resourceName: "fruits"), products: fruitProducts)
        categoryList.append(fruit)
        
        // MARK: - Vegetables
        
        var vegetableProducts: [Product] = []
        
        vegetableProducts.append(Product(name: "Bell Peppers", image: #imageLiteral(resourceName: "bellPepper"), categoryID: 2))
        vegetableProducts.append(Product(name: "Brussels Sprouts", image: #imageLiteral(resourceName: "brusselsSprouts"), categoryID: 2))
        vegetableProducts.append(Product(name: "Broccoli", image: #imageLiteral(resourceName: "broccoli"), categoryID: 2))
        vegetableProducts.append(Product(name: "Carrots", image: #imageLiteral(resourceName: "carrots"), categoryID: 2))
        vegetableProducts.append(Product(name: "Cucumber", image: #imageLiteral(resourceName: "cucumber"), categoryID: 2))
        vegetableProducts.append(Product(name: "Onions", image: #imageLiteral(resourceName: "onions"), categoryID: 2))
        vegetableProducts.append(Product(name: "Potatoes", image: #imageLiteral(resourceName: "potatoes"), categoryID: 2))
        vegetableProducts.append(Product(name: "Spinach", image: #imageLiteral(resourceName: "spinach"), categoryID: 2))
        vegetableProducts.append(Product(name: "Tomatoes", image: #imageLiteral(resourceName: "tomatoes"), categoryID: 2))
        
        let vegetables = Category(name: "Vegetables", image: #imageLiteral(resourceName: "vegetables"), products: vegetableProducts)
        categoryList.append(vegetables)
        
        // MARK: - Meat
        
        var meatProducts: [Product] = []
        
        meatProducts.append(Product(name: "Beef", image: #imageLiteral(resourceName: "beef"), categoryID: 3))
        meatProducts.append(Product(name: "Chicken", image: #imageLiteral(resourceName: "chicken"), categoryID: 3))
        meatProducts.append(Product(name: "Lamb", image: #imageLiteral(resourceName: "lamb"), categoryID: 3))
        meatProducts.append(Product(name: "Pork", image: #imageLiteral(resourceName: "pork"), categoryID: 3))
        
        let meats = Category(name: "Meats", image: #imageLiteral(resourceName: "meat"), products: meatProducts)
        categoryList.append(meats)
        
        // MARK: - Seafood
        
        var seafoodProducts: [Product] = []
        
        seafoodProducts.append(Product(name: "Crab", image: #imageLiteral(resourceName: "crab"), categoryID: 4))
        seafoodProducts.append(Product(name: "Lobster", image: #imageLiteral(resourceName: "lobster"), categoryID: 4))
        seafoodProducts.append(Product(name: "Salmon", image: #imageLiteral(resourceName: "salmon"), categoryID: 4))
        seafoodProducts.append(Product(name: "Shrimp", image: #imageLiteral(resourceName: "shrimp"), categoryID: 4))
        
        let seafood = Category(name: "Seafood", image: #imageLiteral(resourceName: "seafood"), products: seafoodProducts)
        categoryList.append(seafood)
        
        // MARK: - Dairy
        
        var dairyProducts: [Product] = []
        
        dairyProducts.append(Product(name: "Cheese", image: #imageLiteral(resourceName: "cheese"), categoryID: 5))
        dairyProducts.append(Product(name: "Milk", image: #imageLiteral(resourceName: "dairy"), categoryID: 5))
        dairyProducts.append(Product(name: "Yogurt", image: #imageLiteral(resourceName: "yogurt"), categoryID: 5))
        
        let dairy = Category(name: "Dairy", image: #imageLiteral(resourceName: "dairy"), products: dairyProducts)
        categoryList.append(dairy)
        
        // MARK: - Bakery
        
        var bakeryProducts: [Product] = []
        
        bakeryProducts.append(Product(name: "Bagels", image: #imageLiteral(resourceName: "bagel"), categoryID: 6))
        bakeryProducts.append(Product(name: "Bread", image: #imageLiteral(resourceName: "bread"), categoryID: 6))
        bakeryProducts.append(Product(name: "Brownies", image: #imageLiteral(resourceName: "brownie"), categoryID: 6))
        bakeryProducts.append(Product(name: "Cake", image: #imageLiteral(resourceName: "cake"), categoryID: 6))
        bakeryProducts.append(Product(name: "Cookies", image: #imageLiteral(resourceName: "cookies"), categoryID: 6))
        bakeryProducts.append(Product(name: "Cupcakes", image: #imageLiteral(resourceName: "cupcakes"), categoryID: 6))
        bakeryProducts.append(Product(name: "Muffins", image: #imageLiteral(resourceName: "muffins"), categoryID: 6))
        
        let bakery = Category(name: "Bakery", image: #imageLiteral(resourceName: "bakery"), products: bakeryProducts)
        categoryList.append(bakery)
        
        // MARK: - Frozen
        
        var frozenProducts: [Product] = []
        
        frozenProducts.append(Product(name: "Ice Cream", image: #imageLiteral(resourceName: "iceCream"), categoryID: 7))
        frozenProducts.append(Product(name: "Other", image: #imageLiteral(resourceName: "frozen"), categoryID: 7))
        
        let frozen = Category(name: "Frozen", image: #imageLiteral(resourceName: "frozen"), products: frozenProducts)
        categoryList.append(frozen)
        
        // MARK: - Sweets
        
        var sweetProducts: [Product] = []
        
        sweetProducts.append(Product(name: "Candy", image: #imageLiteral(resourceName: "sweets"), categoryID: 8))
        sweetProducts.append(Product(name: "Chocolate", image: #imageLiteral(resourceName: "chocolate"), categoryID: 8))
        sweetProducts.append(Product(name: "Doughnut", image: #imageLiteral(resourceName: "doughnut"), categoryID: 8))
        sweetProducts.append(Product(name: "Marzipan", image: #imageLiteral(resourceName: "marzipan"), categoryID: 8))
        
        let sweets = Category(name: "Sweets", image: #imageLiteral(resourceName: "sweets"), products: sweetProducts)
        categoryList.append(sweets)
        
        // MARK: - Snacks
        
        var snacksProducts: [Product] = []
        
        snacksProducts.append(Product(name: "Chips", image: #imageLiteral(resourceName: "snacks"), categoryID: 9))
        snacksProducts.append(Product(name: "Crackers", image: #imageLiteral(resourceName: "crackers"), categoryID: 9))
        snacksProducts.append(Product(name: "Hummus", image: #imageLiteral(resourceName: "hummus"), categoryID: 9))
        snacksProducts.append(Product(name: "Snack Mix", image: #imageLiteral(resourceName: "snackMix"), categoryID: 9))
        
        let snacks = Category(name: "Snacks", image: #imageLiteral(resourceName: "snacks"), products: snacksProducts)
        categoryList.append(snacks)
        
        // MARK: - Drinks
        
        var drinkProducts: [Product] = []
        
        drinkProducts.append(Product(name: "Coffee", image: #imageLiteral(resourceName: "coffee"), categoryID: 10))
        drinkProducts.append(Product(name: "Energy Drinks", image: #imageLiteral(resourceName: "energyDrink"), categoryID: 10))
        drinkProducts.append(Product(name: "Juice", image: #imageLiteral(resourceName: "juice"), categoryID: 10))
        drinkProducts.append(Product(name: "Soda", image: #imageLiteral(resourceName: "soda"), categoryID: 10))
        drinkProducts.append(Product(name: "Smoothie", image: #imageLiteral(resourceName: "smoothie"), categoryID: 10))
        drinkProducts.append(Product(name: "Tea", image: #imageLiteral(resourceName: "tea"), categoryID: 10))
        
        let drinks = Category(name: "Drinks", image: #imageLiteral(resourceName: "drinks"), products: drinkProducts)
        categoryList.append(drinks)
        
        // MARK: - Hygiene
        
        var hygeineProducts: [Product] = []
        
        hygeineProducts.append(Product(name: "Deodorant", image: #imageLiteral(resourceName: "deodorant"), categoryID: 11))
        hygeineProducts.append(Product(name: "Mouthwash", image: #imageLiteral(resourceName: "mouthwash"), categoryID: 11))
        hygeineProducts.append(Product(name: "Shampoo/Conditioner", image: #imageLiteral(resourceName: "shampoo-conditioner"), categoryID: 11))
        hygeineProducts.append(Product(name: "Soap", image: #imageLiteral(resourceName: "soap"), categoryID: 11))
        hygeineProducts.append(Product(name: "Toothbrush/Toothpaste", image: #imageLiteral(resourceName: "oralCare"), categoryID: 11))
        
        let hygiene = Category(name: "Hygeine", image: #imageLiteral(resourceName: "hygeine"), products: hygeineProducts)
        categoryList.append(hygiene)
        
        // MARK: - Pharmacy
        
        var pharmacyProducts: [Product] = []
        
        pharmacyProducts.append(Product(name: "Band-Aids", image: #imageLiteral(resourceName: "band-aid"), categoryID: 12))
        pharmacyProducts.append(Product(name: "Medication", image: #imageLiteral(resourceName: "pharmacy"), categoryID: 12))
        
        let pharmacy = Category(name: "Pharmacy", image: #imageLiteral(resourceName: "pharmacy"), products: pharmacyProducts)
        categoryList.append(pharmacy)
        
        // MARK: - Home
        
        var homeProducts: [Product] = []
        
        homeProducts.append(Product(name: "Broom/Mop", image: #imageLiteral(resourceName: "broom-mop"), categoryID: 13))
        homeProducts.append(Product(name: "Dish Soap", image: #imageLiteral(resourceName: "dishSoap"), categoryID: 13))
        homeProducts.append(Product(name: "Laundry Supplies", image: #imageLiteral(resourceName: "laundrySupplies"), categoryID: 13))
        homeProducts.append(Product(name: "Vacuum", image: #imageLiteral(resourceName: "vacuum"), categoryID: 13))

        let home = Category(name: "Home", image: #imageLiteral(resourceName: "home"), products: homeProducts)
        categoryList.append(home)
        
        completion(categoryList)
    }
}
