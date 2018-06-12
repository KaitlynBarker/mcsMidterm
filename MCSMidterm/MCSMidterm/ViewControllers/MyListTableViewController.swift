//
//  MyListTableViewController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController, ListTableViewCellDelegate {
    
    var products: [ProductCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        self.tableView.refreshControl = refreshControl
        
        self.title = "My List"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.products = NetworkManager.shared.products
        self.tableView.reloadData()
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
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        let product = self.products[indexPath.row]
        
        cell.delegate = self
        
        cell.product = product
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = self.products[indexPath.row]
            NetworkManager.shared.deleteProduct(product: product)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - ListTableViewCellDelegate
    
    func listProductWasUpdated(cell: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let product = self.products[indexPath.row]
        
        NetworkManager.shared.isPurchasedToggle(product: product)
        cell.updateViews()
    }
}
