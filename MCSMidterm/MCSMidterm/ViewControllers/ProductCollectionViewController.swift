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
    var selectedProducts: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let productSet = self.category?.products else { return }
        
        self.products = productSet
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        // retreive core data
        var currentSelectedProducts = NetworkManager.shared.selectedProducts
        // compare to selected items
        //        guard let indexPaths = collectionView?.indexPathsForSelectedItems else { return }
        
        // filter out the already selected items from the selectedProducts array.
        
        let filterResult = self.selectedProducts.filter { (product) -> Bool in
            return !currentSelectedProducts.contains(product)
        }
        
        currentSelectedProducts.append(contentsOf: filterResult)
        NetworkManager.shared.saveArray(array: currentSelectedProducts)
        
        
        //        for indexPath in indexPaths {
        //            let product = self.selectedProducts[indexPath.row]
        //            if currentSelectedProducts.contains(product) {
        //                selectedProducts.remove(at: indexPath.row)
        //            } else {
        //                currentSelectedProducts.append(product)
        //                // save the new array of products that was returned.
        //            }
        //        }
        
        // show an alert that says that the data was saved.
        let alert = UIAlertController(title: "Products saved to list", message: "", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
        
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
        
        if let index = selectedProducts.index(of: product) {
            selectedProducts.remove(at: index)
        } else {
            selectedProducts.append(product)
        }
        
        NetworkManager.shared.isSelectedToggle(product: product)
        cell.updateViews()
    }
    
}
