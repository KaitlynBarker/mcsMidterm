//
//  MyListTableViewController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController, ListTableViewCellDelegate {
    
    let products = ProductController.shared.products
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillCategoryArray()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillCategoryArray() {
        guard let firstProduct = products.first else { return }
        var category = firstProduct.category
        var productsArray: [Product] = []
        
        for index in 0..<self.products.count {
            if products[index].category == category {
                productsArray.append(products[index])
            } else {
                guard let newCategory = products[index].category else { return }
                self.categories.append(newCategory)
                category = self.products[index].category
                productsArray.removeAll()
                productsArray.append(products[index])
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories[section].products?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }

        cell.delegate = self
        
        let product = ProductController.shared.products[indexPath.row]
        
        cell.product = product

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = self.products[indexPath.row]
            ProductController.shared.isSelectedToggle(product: product)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - ListTableViewCellDelegate
    
    func listProductWasUpdated(cell: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let product = self.products[indexPath.row]
        
        ProductController.shared.isPurchasedToggle(product: product)
        cell.updateViews()
    }
}
