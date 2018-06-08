//
//  ProductController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import Foundation
import CoreData

class ProductController {
    static let shared = ProductController()
    
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
    
    func isSelectedToggle(product: Product) {
        product.isSelected = !product.isSelected
        self.save()
    }
    
    func isPurchasedToggle(product: Product) {
        product.isPurchased = !product.isPurchased
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
}
