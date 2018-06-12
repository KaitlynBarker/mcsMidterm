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
    var products: [Product] = []
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
        var currentSelectedProducts = NetworkManager.shared.products.map { Product(name: $0.name!, image: $0.image as? UIImage) }
        // compare to selected items
        
        // filter out the already selected items from the selectedProducts array.
        
        let filterResult = self.selectedProducts.filter { (product) -> Bool in
            return !currentSelectedProducts.contains(product)
        }
        
        currentSelectedProducts.append(contentsOf: filterResult)
        NetworkManager.shared.saveArray(array: currentSelectedProducts)
        
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        cell.delegate = self
        
        let product = self.products[indexPath.row]
        
        cell.product = product
        
        return cell
    }
    
    // MARK: - ProductCollectionCellDelegate
    
    func productWasUpdated(cell: ProductCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let product = self.products[indexPath.row]
        
        if let index = selectedProducts.index(of: product) {
            selectedProducts.remove(at: index)
        } else {
            selectedProducts.append(product)
        }
        
        NetworkManager.shared.isSelectedToggle(product: product)
        cell.updateViews()
    }
    
}
