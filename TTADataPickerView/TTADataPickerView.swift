//
//  TTADataPickerView.swift
//  TTAUtils_Swift
//
//  Created by TobyoTenma on 03/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//
/**
 TTADataPickerView A View allow you select date or text easily
 
 - example: *To show the picker view* `show()`
 - example: *To dismiss the picker view* `dismiss()`
 
 - author: TobyoTenma
 - date: 03/12/2017
 - version: 0.9
 */

import UIKit

/// The component tpye of the TTADataPickerView

public enum TTADataPickerViewType {
    /// pickerView default
    case text
    /// datePicker default, date
    case date
    /// date and time
    case dateTime
    /// time
    case time
}

/// TTADataPickerViewDelegate

public protocol TTADataPickerViewDelegate: NSObjectProtocol {
    
    /// When the type of dataPickerView is `.text`, you should use this function to handle the selection
    ///
    /// - Parameters:
    ///   - pickerView: PickerView
    ///   - titles: Selected titles
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectTitles titles: [String])
    
    /// When the type of dataPickerView is *NOT* `.text`, you should use this function to handle the selection
    ///
    /// - Parameters:
    ///   - pickerView: PickerView
    ///   - date: Selected date
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectDate date: Date)
    
    /// When any row of any component's value changed, this function will be called
    ///
    /// - Parameters:
    ///   - pickerView: PickerView
    ///   - row: Changed row
    ///   - component: Changed component
    func dataPickerView(_ pickerView: TTADataPickerView, didChange row: Int, inComponent component: Int)
    
    /// Clicked the cancelButton will call this function
    ///
    /// - Parameter pickerView: Picker View
    func dataPickerViewWillCancel(_ pickerView: TTADataPickerView)
    
    /// Clicked the cancelButton this function will be called At the very end of handled all the things
    ///
    /// - Parameter pickerView: Picker View
    func dataPickerViewDidCancel(_ pickerView: TTADataPickerView)
}

// MARK: - Optional delegate functions

public extension TTADataPickerViewDelegate {
    
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectTitles titles: [String]) {
        
    }
    
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectDate date: Date) {
        
    }
    
    func dataPickerView(_ pickerView: TTADataPickerView, didChange row: Int, inComponent component: Int) {
        
    }
    
    func dataPickerViewWillCancel(_ pickerView: TTADataPickerView) {
        
    }
    
    func dataPickerViewDidCancel(_ pickerView: TTADataPickerView){
        
    }
}

/// TTADataPickerView
open class TTADataPickerView: UIView {
    
    // MARK: - Public properties
    
    public weak var delegate: TTADataPickerViewDelegate?
    
    /// Picker view component type, for MORE TTADataPickerViewType
    public var type: TTADataPickerViewType = .text {
        didSet {
            switch type {
            case .text:
                pickerView?.isHidden = false
                datePicker?.isHidden = true
            case .date:
                datePicker?.datePickerMode = .date
                pickerView?.isHidden = true
                datePicker?.isHidden = false
            case .dateTime:
                datePicker?.datePickerMode = .dateAndTime
                pickerView?.isHidden = true
                datePicker?.isHidden = false
            case .time:
                datePicker?.datePickerMode = .time
                pickerView?.isHidden = true
                datePicker?.isHidden = false
            }
        }
    }
    
    /// When the type of pickerView is `.text`, this property should be set
    public var textItemsForComponent: [[String]]? {
        didSet {
            pickerView?.reloadAllComponents()
        }
    }
    
    // MARK: - Private properties
    fileprivate lazy var pickerView: UIPickerView? = {
        let toolBarFrame = self.toolBar.frame
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: toolBarFrame.maxY, width: toolBarFrame.width, height: 216))
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    fileprivate lazy var datePicker: UIDatePicker? = {
        let toolBarFrame = self.toolBar.frame
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: toolBarFrame.maxY, width: toolBarFrame.width, height: 216))
        datePicker.datePickerMode = .date
        return datePicker
    }()
    fileprivate let toolBar: TTADataPickerToolBar = {
        let toolBar = TTADataPickerToolBar()
        return toolBar
    }()
    
    fileprivate let dataPickerController = TTADataPickerViewController()
    
    override init(frame: CGRect) {
        var rect = UIScreen.main.bounds
        rect.size.height = 260 // 216 + 44
        super.init(frame: rect)
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        var rect = UIScreen.main.bounds
        rect.size.height = 260 // 216 + 44
        super.init(coder: aDecoder)
        setupUI()
    }
    
    public convenience init(title: String, type: TTADataPickerViewType) {
        self.init(frame: CGRect.zero)
        toolBar.titleButton.title = title
        configType(type: type)
    }
    
    private func setupUI() {
        backgroundColor = .white
        // toolbar
        toolBar.barStyle = .default
        toolBar.cancelButton.target = self
        toolBar.cancelButton.action = #selector(didClickCancelButton(button:))
        toolBar.confirmButton.target = self
        toolBar.confirmButton.action = #selector(didClickConfirmButton(button:))
        addSubview(toolBar)
        
        guard let picker = pickerView else { return }
        self.addSubview(picker)
        guard let apicker = datePicker else { return }
        self.addSubview(apicker)
    }
    
    /// the initializer can NOT call the `didSet` and `willSet` method, so we need this function
    private func configType(type: TTADataPickerViewType) {
        self.type = type
    }
}

// MARK: - Public Functions & Properties

extension TTADataPickerView {
    
    // MARK: - Public ReadOnly properties, Global apperance properties
    
    var cancelButtonAttributes: [String: Any]? {
        get {
            return toolBar.cancelButton.titleTextAttributes(for: .normal)
        }
    }
    
    var confirmButtonAttributes: [String: Any]? {
        get {
            return toolBar.confirmButton.titleTextAttributes(for: .normal)
        }
    }
    
    var toolBarBarTintColor: UIColor? {
        get {
            return toolBar.barTintColor
        }
    }
    
    var toolBarTintColor: UIColor? {
        get {
            return toolBar.tintColor
        }
    }
    
    var titleFont: UIFont {
        get {
            return toolBar.titleButton.font!
        }
    }
    
    var titleColor: UIColor {
        get {
            return toolBar.titleButton.titleColor!
        }
    }
    
    // MARK: - Public Functions
    // MARK: - Global apperance properties functions
    dynamic open func setConfirmButtonAttributes(att: [String: Any]?) {
        toolBar.confirmButton.setTitleTextAttributes(att, for: .normal)
    }
    
    dynamic open func setCancelButtonAttributes(att: [String: Any]?) {
        toolBar.cancelButton.setTitleTextAttributes(att, for: .normal)
    }
    
    dynamic open func setToolBarBarTintColor(color: UIColor?) {
        toolBar.barTintColor = color
    }
    
    dynamic open func setToolBarTintColor(color: UIColor?) {
        toolBar.tintColor = color
    }
    
    dynamic open func setTitleFont(font: UIFont) {
        toolBar.titleButton.font = font
    }
    
    dynamic open func setTitleColor(color: UIColor) {
        toolBar.titleButton.titleColor = color
    }
    
    /// ReloadComponent
    ///
    /// - Parameter component: Component
    open func reloadComponent(component: Int) {
        pickerView?.reloadComponent(component)
    }
    
    /// ReloadAll Components
    open func reloadAllComponents() {
        pickerView?.reloadAllComponents()
    }
    
    /// Selected titles, When the type is `.text`, call this function will set the PickerView select the titles
    ///
    /// - Parameters:
    ///   - titles: Selected titles
    ///   - animated: Is select with Animation, default is true
    open func selectedTitles(_ titles: [String]?, animated: Bool = true) {
        guard type == .text else { return }
        let totalComponent = min(titles?.count ?? 0, pickerView?.numberOfComponents ?? 0)
        for component in 0..<totalComponent {
            let items = textItemsForComponent?[component]
            guard let title = titles?[component] else { continue }
            guard let _ = items?.contains(title) else { continue }
            guard let row = items?.index(of: title) else { continue }
            pickerView?.selectRow(row, inComponent: component, animated: animated)
        }
    }
    
    /// Selected the date, When the type is NOT `.text`, call this function will set the datePicker select the date
    ///
    /// - Parameters:
    ///   - date: Selected date
    ///   - animated: Is select with Animation, default is true
    open func selectedDate(_ date: Date?, animated: Bool = true) {
        guard let selectedDate = date else { return }
        datePicker?.setDate(selectedDate, animated: animated)
    }
    
    /// Show the DatePickerView
    ///
    /// - Parameter completion: Complection handler
    open func show(with completion: (() -> Void)? = nil) {
        dataPickerController.showPickerView(pickerView: self, completion: completion)
    }
    
    /// Dismiss the the DatePickerView
    ///
    /// - Parameter completion: Complection handler
    open func dismiss(with completion: (() -> Void)? = nil) {
        dataPickerController.dismissWithCompletion(completion: completion)
    }
}

// MARK: - Private Functions
// MARK: - Actions

extension TTADataPickerView {
    
    @objc fileprivate func didClickCancelButton(button: UIButton) {
        dismiss()
    }
    
    @objc fileprivate func didClickConfirmButton(button: UIButton) {
        switch type {
        case .text:
            guard let componentCount = pickerView?.numberOfComponents else { return }
            var textItems = [String]()
            for component in 0..<componentCount {
                guard let row = pickerView?.selectedRow(inComponent: component), let title = textItemsForComponent?[component][row] else { continue }
                textItems.append(title)
            }
            delegate?.dataPickerView(self, didSelectTitles: textItems)
        case .date, .dateTime, .time:
            guard let date = datePicker?.date else { return }
            delegate?.dataPickerView(self, didSelectDate: date)
        }
        dismiss()
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension TTADataPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return textItemsForComponent?.count ?? 0
    }

    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let items = textItemsForComponent?[component] else { return 0 }
        return items.count
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let items = textItemsForComponent?[component] else { return nil }
        return items[row]
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let componentCount = pickerView.numberOfComponents
        for index in 0..<componentCount {
            guard index != component && index > component else { continue }
            pickerView.reloadComponent(index)
            pickerView.selectRow(0, inComponent: index, animated: true)
        }
        delegate?.dataPickerView(self, didChange: row, inComponent: component)
    }
}
