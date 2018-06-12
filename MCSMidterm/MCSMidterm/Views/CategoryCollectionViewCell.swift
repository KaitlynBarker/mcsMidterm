//
//  CategoryCollectionViewCell.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/8/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var category: Category? {
        didSet {
            self.updateViews()
        }
    }
    
    func updateViews() {
        guard let category = self.category, let image = category.image else { return }
        
        let name = category.name
        
        self.categoryImageView.image = image
        self.nameLabel.text = name
        self.nameLabel.textColor = UIColor.white
        self.nameLabel.backgroundColor = UIColor.darkGray
    }
    
}
