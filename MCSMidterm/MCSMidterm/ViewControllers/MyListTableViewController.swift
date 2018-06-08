//
//  MyListTableViewController.swift
//  MCSMidterm
//
//  Created by Kaitlyn Barker on 6/7/18.
//  Copyright © 2018 Kaitlyn Barker. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController, ListTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
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
            let product = ProductController.shared.products[indexPath.row]
            ProductController.shared.isSelectedToggle(product: product)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - ListTableViewCellDelegate
    
    func listProductWasUpdated(cell: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let product = ProductController.shared.products[indexPath.row]
        
        ProductController.shared.isPurchasedToggle(product: product)
        cell.updateViews()
    }
}
