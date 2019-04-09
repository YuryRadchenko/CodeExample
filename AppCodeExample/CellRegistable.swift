//
//  CellRegistable.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

protocol CellRegistable { }

extension CellRegistable {
    static func register(table: UITableView) {
        let nibName = String(describing: self)
        let nib = UINib.init(nibName: nibName, bundle: nil)
        let cellReuseIdentifier = String(describing: self)
        
        table.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

