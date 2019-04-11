//
//  CEAboutHeaderView.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/10/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEAboutHeaderView: UIView, XibViewInitializable {
    
    private enum Metrics {
        static let appNameFont = UIFont.boldSystemFont(ofSize: 32)
        static let appVersionFont = UIFont.systemFont(ofSize: 17)
    }
    
    static var viewHeight: CGFloat {
        let width = UIScreen.main.bounds.width - 16.0 - 16.0
        let appNameHeight = UILabel.height(text: ThisApp.appName, font: Metrics.appNameFont, width: width)
        
        let appVersionHeight = UILabel.height(text: "version " + Bundle.main.versionFull, font: Metrics.appVersionFont, width: width)
        
        return 50.0 + appNameHeight + 5.0 + appVersionHeight + 50.0
    }
    
    @IBOutlet var contentView: UIView! {
        didSet {
            guard let view = contentView else { return }
            view.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var appNameLabel: UILabel! {
        didSet {
            guard let label = appNameLabel else { return }
            label.text = ThisApp.appName
            label.textColor = .black
            label.textAlignment = .center
            label.font = Metrics.appNameFont
            label.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var appVersionLabel: UILabel! {
        didSet {
            guard let label = appVersionLabel else { return }
            label.text = "version " + Bundle.main.versionFull
            label.textColor = .black
            label.textAlignment = .center
            label.font = Metrics.appVersionFont
            label.numberOfLines = 0
        }
    }
    
    //MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initXibView()
        self.initialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initXibView()
        self.initialization()
    }
    
    private func initialization() {
        
    }
}
