//
//  UITableView.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

struct TableOption {
    
    var separatorStyle: UITableViewCell.SeparatorStyle = .singleLine
    var separatorInset: UIEdgeInsets = .zero
    var separatorColor: UIColor = .gray
    
    var contentInset: UIEdgeInsets = UIEdgeInsets(top: 0, bottom: 0)
    var tableFooterView: UIView? = UIView()
    
    var isUserInteractionEnabled = true
    var isScrollEnabled = true
    var showsVerticalScrollIndicator = true
    var showsHorizontalScrollIndicator = false
    
    var estimatedRowHeight: CGFloat = 44.0
    var rowHeight: CGFloat = UITableView.automaticDimension
    
    var keyboardDismissMode: UIScrollView.KeyboardDismissMode = .interactive
}

extension UITableView {
    
    func config(options: TableOption) {
        self.separatorStyle = options.separatorStyle
        self.separatorColor = options.separatorColor
        self.separatorInset = options.separatorInset
        
        self.contentInset = options.contentInset
        self.tableFooterView = options.tableFooterView
        
        self.isUserInteractionEnabled = options.isUserInteractionEnabled
        self.isScrollEnabled = options.isScrollEnabled
        self.showsVerticalScrollIndicator = options.showsVerticalScrollIndicator
        self.showsHorizontalScrollIndicator = options.showsHorizontalScrollIndicator
        
        self.estimatedRowHeight = options.estimatedRowHeight
        self.rowHeight = options.rowHeight
        
        self.keyboardDismissMode = options.keyboardDismissMode
    }
}

extension UITableView {
    
    func reloadData(completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }) { (complited) in
            completion()
        }
    }
    
    func selectRow(at indexPath: IndexPath, animated: Bool, scrollPosition: UITableView.ScrollPosition, completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0, animations: {
            self.selectRow(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        }) { (complited) in
            completion()
        }
    }
}
