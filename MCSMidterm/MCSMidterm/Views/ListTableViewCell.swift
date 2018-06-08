//
//  ListTableViewCell.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/8/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.listProductWasUpdated(cell: self)
    }
    
    weak var delegate: ListTableViewCellDelegate?
    
    var product: Product? {
        didSet {
            self.updateViews()
        }
    }
    
    func updateViews() {
        guard let product = self.product, let image = product.image as? UIImage, let name = product.name else { return }
        
        self.productImageView.image = image
        self.nameLabel.text = name
        
        if product.isPurchased {
            completeButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            completeButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        }
    }
    
}

protocol ListTableViewCellDelegate: class {
    func listProductWasUpdated(cell: ListTableViewCell)
}
