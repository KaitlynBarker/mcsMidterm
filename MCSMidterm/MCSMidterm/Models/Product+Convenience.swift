//
//  Product+Convenience.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Product {
    convenience init(name: String, isPurchased: Bool, isSelected: Bool, image: UIImage, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.name = name
        self.isPurchased = isPurchased
        self.isSelected = isSelected
        self.image = image
    }
}
