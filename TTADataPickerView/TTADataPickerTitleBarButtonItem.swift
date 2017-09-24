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
        return titleView
    }()
    
    fileprivate let titleButton: UIButton = {
        let titleButton = UIButton(type: UIButtonType.custom)
        titleButton.isEnabled = false
        titleButton.titleLabel?.numberOfLines = 3
        titleButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 1), for: UIControlState.normal)
        titleButton.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        titleButton.backgroundColor = .clear
        titleButton.titleLabel?.textAlignment = NSTextAlignment.center
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
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
        layoutViews()
        customView = titleView
    }
    
    func layoutViews() {
        if #available(iOS 11.0, *) {
            titleView.translatesAutoresizingMaskIntoConstraints = false
            titleView.setContentHuggingPriority(UILayoutPriorityDefaultLow - 1, for: .vertical)
            titleView.setContentHuggingPriority(UILayoutPriorityDefaultLow - 1, for: .horizontal)
            titleView.setContentHuggingPriority(UILayoutPriorityDefaultHigh - 1, for: .vertical)
            titleView.setContentHuggingPriority(UILayoutPriorityDefaultHigh - 1, for: .horizontal)
            
            titleButton.translatesAutoresizingMaskIntoConstraints = false
            titleButton.setContentHuggingPriority(UILayoutPriorityDefaultLow - 1, for: .vertical)
            titleButton.setContentHuggingPriority(UILayoutPriorityDefaultLow - 1, for: .horizontal)
            titleButton.setContentHuggingPriority(UILayoutPriorityDefaultHigh - 1, for: .vertical)
            titleButton.setContentHuggingPriority(UILayoutPriorityDefaultHigh - 1, for: .horizontal)
            
            let top = NSLayoutConstraint(item: titleButton, attribute: .top, relatedBy: .equal, toItem: titleView, attribute: .top, multiplier: 1, constant: 0)
            let bottom = NSLayoutConstraint(item: titleButton, attribute: .bottom, relatedBy: .equal, toItem: titleView, attribute: .bottom, multiplier: 1, constant: 0)
            let leading = NSLayoutConstraint(item: titleButton, attribute: .leading, relatedBy: .equal, toItem: titleView, attribute: .leading, multiplier: 1, constant: 0)
            let trailing = NSLayoutConstraint(item: titleButton, attribute: .trailing, relatedBy: .equal, toItem: titleView, attribute: .trailing, multiplier: 1, constant: 0)
            titleView.addConstraints([top, bottom, leading, trailing])
        } else {
            titleButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            titleView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
