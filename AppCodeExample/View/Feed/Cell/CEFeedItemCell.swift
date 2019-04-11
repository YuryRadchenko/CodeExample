//
//  CEFeedItemCell.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEFeedItemCell: UITableViewCell, CellRegistable, CellDequeueReusable {
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            guard let label = dateLabel else { return }
            label.text = nil
            label.textColor = .darkGray
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 13)
            label.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var cellTitle: UILabel! {
        didSet {
            guard let label = cellTitle else { return }
            label.text = nil
            label.numberOfLines = 0
            label.textAlignment = .left
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
    
    @IBOutlet weak var authorLabel: UILabel! {
        didSet {
            guard let label = authorLabel else { return }
            label.text = nil
            label.textColor = .lightGray
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 11)
            label.numberOfLines = 0
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.dateLabel.text = nil
        self.cellTitle.text = nil
        self.authorLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .default
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(item: CEFeedItem) {
        
        self.dateLabel.text = item.datePublishedFormatted
        
        self.cellTitle.text = item.title
        
        if let author = item.author?.name {
            self.authorLabel.text = "Author: \(author)"
        }
    }
}
