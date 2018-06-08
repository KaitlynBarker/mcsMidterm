//
//  ItemsCollectionViewController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

private let reuseIdentifier = "categoryCell"

class ItemsCollectionViewController: UICollectionViewController {
    
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getCategoryList { (categories) in
            self.categories = categories
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductListVC" {
            guard let destinationVC = segue.destination as? ProductCollectionViewController else { return }
            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            let category = self.categories[indexPath.row]
            
            destinationVC.category = category
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let category = self.categories[indexPath.row]
        
        cell.category = category
    
        return cell
    }
}
