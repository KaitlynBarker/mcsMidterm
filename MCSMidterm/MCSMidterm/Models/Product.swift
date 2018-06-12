//
//  Product.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/11/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import Foundation
import UIKit

class Product: Equatable {
    let name: String
    var isPurchased: Bool
    var isSelected: Bool
    let image: UIImage?
    let categoryID: Int?
    
    init(name: String, isPurchased: Bool = false, isSelected: Bool = false, image: UIImage? = UIImage(), categoryID: Int? = nil) {
        self.name = name
        self.isPurchased = isPurchased
        self.isSelected = isSelected
        self.image = image
        self.categoryID = categoryID
    }
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name
    }
}

