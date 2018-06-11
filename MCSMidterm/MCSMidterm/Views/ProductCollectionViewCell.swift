//
//  ProductCollectionViewCell.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/8/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isSelectedButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func isSelectedButtonTapped(_ sender: UIButton) {
        delegate?.productWasUpdated(cell: self)
    }
    
    weak var delegate: ProductCollectionViewCellDelegate?
    
    var product: Product? {
        didSet {
            self.updateViews()
        }
    }
    
    func updateViews() {
        guard let product = self.product, let image = product.image as? UIImage, let name = product.name else { return }
        
        self.productImageView.image = image
        self.nameLabel.text = name
        self.nameLabel.backgroundColor = UIColor.darkGray
        self.nameLabel.textColor = UIColor.white
        
        if product.isSelected == true {
            productImageView.image = #imageLiteral(resourceName: "complete")
        } else {
            productImageView.image = image
        }
    }
}

protocol ProductCollectionViewCellDelegate: class {
    func productWasUpdated(cell: ProductCollectionViewCell)
}
