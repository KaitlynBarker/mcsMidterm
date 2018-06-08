//
//  ProductCollectionViewController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

private let reuseIdentifier = "categoryProductCell"

class ProductCollectionViewController: UICollectionViewController, ProductCollectionViewCellDelegate {
    
    var category: Category?
    var products: NSSet = []
    
    var selectedProducts: [Product] {
        return products.filter({ (product) -> Bool in
            guard let product = product as? Product else { return false }
            return product.isSelected == true
        }) as! [Product]
    }
    
    var purchasedProducts: [Product] {
        return products.filter({ (product) -> Bool in
            guard let product = product as? Product else { return false }
            return product.isPurchased == true
        }) as! [Product]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let productSet = self.category?.products else { return }
        
        self.products = productSet
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProductCollectionViewCell, let product = self.products.allObjects[indexPath.row] as? Product else { return UICollectionViewCell() }
    
        cell.delegate = self
        
        cell.product = product
    
        return cell
    }
    
    // MARK: - ProductCollectionCellDelegate
    
    func productWasUpdated(cell: ProductCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        guard let product = self.products.allObjects[indexPath.row] as? Product else { return }
        
        ProductController.shared.isSelectedToggle(product: product)
        cell.updateViews()
    }

}
