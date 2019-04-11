//
//  XibViewInitializable.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

protocol XibViewInitializable {
    var contentView: UIView! {get set}
}

extension XibViewInitializable where Self: UIView {
    func initXibView() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        guard let content = self.contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}
