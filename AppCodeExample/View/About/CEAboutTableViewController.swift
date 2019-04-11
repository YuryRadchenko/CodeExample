//
//  CEAboutTableViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/10/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEAboutTableViewController: UITableViewController {
    
    private var items: [AboutCellModel] = AboutCellModel.allCases
    
    private var headerView: CEAboutHeaderView {
        let rect = CGRect(width: UIScreen.main.bounds.width,
                          height: CEAboutHeaderView.viewHeight)
        return CEAboutHeaderView(frame: rect)
    }
    
    var didTap:((_ cell: AboutCellModel) -> Void)?
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
    }
    
    private func configTableView() {
        
        let options = TableOption()
        self.tableView.config(options: options)
        self.tableView.tableHeaderView = self.headerView
        
        CESupportCell.register(table: self.tableView)
        CEDescriptionCell.register(table: self.tableView)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = self.items[indexPath.row]
        switch cellModel {
        case .linkedin, .support:
            let cell = CESupportCell.cell(table: tableView, indexPath: indexPath)
            cell.config(cellModel)
            return cell
            
        case .description:
            let cell = CEDescriptionCell.cell(table: tableView, indexPath: indexPath)
            cell.config(cellModel)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellModel = self.items[indexPath.row]
        self.didTap?(cellModel)
    }
}
