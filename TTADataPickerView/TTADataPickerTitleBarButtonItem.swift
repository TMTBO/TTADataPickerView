//
//  TTADataPickerTitleBarButtonItem.swift
//  TTAUtils_Swift
//
//  Created by TobyoTenma on 03/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import UIKit

class TTADataPickerTitleBarButtonItem: UIBarButtonItem {
    
    public var font: UIFont? = UIFont.systemFont(ofSize: 14) {
        didSet {
            guard let titleFont = font else { return }
            titleButton.titleLabel?.font = titleFont
        }
    }
    
    public var titleColor: UIColor? = UIColor.lightGray {
        didSet {
            guard let color = titleColor else {
                titleButton.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
                return
            }
            titleButton.setTitleColor(color, for: UIControlState.disabled)
        }
    }
    
    fileprivate let titleView: UIView = {
        let titleView = UIView()
        titleView.backgroundColor = UIColor.clear
        titleView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return titleView
    }()
    
    fileprivate let titleButton: UIButton = {
        let titleButton = UIButton(type: UIButtonType.custom)
        titleButton.isEnabled = false
        titleButton.titleLabel?.numberOfLines = 3
        titleButton.setTitleColor(UIColor(colorLiteralRed: 0.0, green: 0.5, blue: 1.0, alpha: 1.0), for: UIControlState.normal)
        titleButton.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        titleButton.backgroundColor = .clear
        titleButton.titleLabel?.textAlignment = NSTextAlignment.center
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        titleButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return titleButton
    }()

    override var title: String? {
        didSet {
            titleButton.setTitle(title, for: UIControlState.normal)
        }
    }
    
    override init() {
        super.init()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    convenience init(title: String?) {
        self.init()
        self.title = title
    }
}

fileprivate extension TTADataPickerTitleBarButtonItem {
    
    func setupUI() {
        titleView.addSubview(titleButton)
        customView = titleView
    }
}
