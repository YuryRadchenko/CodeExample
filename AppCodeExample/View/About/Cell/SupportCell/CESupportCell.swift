//
//  CESupportCell.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/10/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CESupportCell: UITableViewCell, CellRegistable, CellDequeueReusable {
    
    @IBOutlet weak var cellTitle: UILabel! {
        didSet {
            guard let label = cellTitle else { return }
            label.numberOfLines = 0
            label.text = nil
        }
    }
    
    @IBOutlet weak var valueLabel: UILabel! {
        didSet {
            guard let label = valueLabel else { return }
            label.numberOfLines = 0
            label.text = nil
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.cellTitle.text = nil
        self.valueLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .default
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(_ data: DataCellModelProtocol) {
        self.cellTitle.text = data.title
        self.valueLabel.text = data.value
    }
}

extension CESupportCell {
    
}
