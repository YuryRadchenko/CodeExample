//
//  CEFeedTableViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEFeedTableViewController: UITableViewController {
    
    var items: [CEFeedItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var didTap:((_: CEFeedItem) -> Void)?
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
    }
    
    private func configTableView() {
        let options = TableOption()
        self.tableView.config(options: options)
        CEFeedItemCell.register(table: self.tableView)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.items[indexPath.row]
        let cell = CEFeedItemCell.cell(table: tableView, indexPath: indexPath)
        cell.config(item: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = self.items[indexPath.row]
        self.didTap?(item)
    }
}
