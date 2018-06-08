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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let productSet = self.category?.products else { return }
        
        self.products = productSet
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

    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    // MARK: - ProductCollectionCellDelegate
    
    func productWasUpdated(cell: ProductCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        guard let product = self.products.allObjects[indexPath.row] as? Product else { return }
        
        ProductController.shared.isSelectedToggle(product: product)
        cell.updateViews()
    }

}
