//
//  TTADataPickerToolBar.swift
//  TTAUtils_Swift
//
//  Created by TobyoTenma on 03/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import UIKit

class TTADataPickerToolBar: UIToolbar {
    let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil
        , action: nil)
    let confirmButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil)
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil
        , action: nil)
    let titleButton = TTADataPickerTitleBarButtonItem(title: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 11.0, *) {
            return
        }
        var leftRect = CGRect.zero
        var rightRect = CGRect.zero
        var isTitleBarButtonFound = false
        
        let sortedSubviews = subviews.sorted(by: { (view1 : UIView, view2 : UIView) -> Bool in
            let x1 = view1.frame.minX
            let x2 = view2.frame.minX
            
            if x1 != x2 {
                return x1 < x2
            } else {
                let y1 = view1.frame.minY
                let y2 = view2.frame.minY
                return y1 < y2
            }
        })
        
        for barButtonItemView in sortedSubviews {
            if (isTitleBarButtonFound == true) {
                rightRect = barButtonItemView.frame
                break
            } else if (barButtonItemView.isMember(of: UIView.self)) {
                isTitleBarButtonFound = true
            } else if (barButtonItemView.isKind(of: UIControl.self)) {
                leftRect = barButtonItemView.frame
            }
        }
        
        var x : CGFloat = 8
        
        if (leftRect != .zero) {
            x = leftRect.maxX + 8
        }
        
        let width : CGFloat = rightRect.minX - leftRect.maxX - 16
        
        titleButton.customView?.frame = CGRect(x: x, y: 0, width: width, height: self.frame.size.height)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 44
        return size
    }
}

fileprivate extension TTADataPickerToolBar {
    
    func setupUI() {
        sizeToFit()
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        isTranslucent = true
        tintColor = UIColor.black // default tint color is black
        barTintColor = nil
        items = [cancelButton, flexibleSpace, titleButton, flexibleSpace, confirmButton]
    }
}
