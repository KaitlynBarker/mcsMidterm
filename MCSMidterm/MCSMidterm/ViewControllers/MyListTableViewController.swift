//
//  MyListTableViewController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController, ListTableViewCellDelegate {
    
    var products = NetworkManager.shared.selectedProducts
//    var products: [Product] = []
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        self.tableView.refreshControl = refreshControl
        
        self.title = "My List"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.fillCategoryArray()
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Refresh Func
    
    @objc func refresh() {
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let name = self.categories[section].name else { return "" }
        return name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories[section].products?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ListTableViewCell, let product = self.categories[indexPath.section].products?.allObjects[indexPath.row] as? Product else { return UITableViewCell() }

        cell.delegate = self
        
        cell.product = product

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let product = self.categories[indexPath.section].products?.allObjects[indexPath.row] as? Product else { return }
            NetworkManager.shared.deleteProduct(product: product)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - ListTableViewCellDelegate
    
    func listProductWasUpdated(cell: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        guard let product = self.categories[indexPath.section].products?.allObjects[indexPath.row] as? Product else { return }
        
        NetworkManager.shared.isPurchasedToggle(product: product)
        cell.updateViews()
    }
}
