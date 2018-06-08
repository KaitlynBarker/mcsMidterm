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
        
    }
    
}
