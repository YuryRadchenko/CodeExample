//
//  CEDescriptionCell.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/10/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEDescriptionCell: UITableViewCell, CellRegistable, CellDequeueReusable {
    
    @IBOutlet weak var valueLabel: UILabel! {
        didSet {
            guard let label = valueLabel else { return }
            label.numberOfLines = 0
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.valueLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(_ data: DataCellModelProtocol) {
        self.valueLabel.text = data.value
    }
}
