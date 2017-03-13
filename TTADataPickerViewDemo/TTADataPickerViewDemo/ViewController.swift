//
//  ViewController.swift
//  TTADataPickerViewDemo
//
//  Created by TobyoTenma on 13/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import UIKit

let dateFormatter = DateFormatter()

class ViewController: UIViewController {
    
//    let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)

    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apperance = TTADataPickerView.appearance()
        apperance.setConfirmButtonAttributes(att: [NSForegroundColorAttributeName: UIColor.red])
        apperance.setCancelButtonAttributes(att: [NSForegroundColorAttributeName: UIColor.blue])
        apperance.setToolBarTintColor(color: .yellow)
        apperance.setToolBarBarTintColor(color: .orange)
        apperance.setTitleFont(font: UIFont.systemFont(ofSize: 20))
        apperance.setTitleColor(color: .cyan)
        
    }
    

    @IBAction func showTextType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .text
        pickerView.delegate = self
        pickerView.textItemsForComponent = [["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]]
        pickerView.show()
    }
    @IBAction func showDateType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .date
        pickerView.delegate = self
        pickerView.show { 
            UIView.animate(withDuration: 0.3, animations: { 
                self.view.backgroundColor = UIColor(white: 1.0, alpha: 0.96)
            })
        }
        
    }
    @IBAction func showTimeType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .time
        pickerView.delegate = self
    }
    @IBAction func showDateTimeType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .dateTime
        pickerView.delegate = self
    }

}

extension ViewController: TTADataPickerViewDelegate {
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectTitles titles: [String]) {
        showLabel.text = titles.joined(separator: " ")
    }
    
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectDate date: Date) {
        if pickerView.type == .date {
            dateFormatter.dateStyle = .medium
        } else if pickerView.type == .time {
            dateFormatter.timeStyle = .medium
        } else if pickerView.type == .dateTime {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
        }
        showLabel.text = dateFormatter.string(from: date)
    }
    
    func dataPickerView(_ pickerView: TTADataPickerView, didChange row: Int, inComponent component: Int) {
        print(#function)
    }
    
    func dataPickerViewWillCancel(_ pickerView: TTADataPickerView) {
        print(#function)
    }
    
    func dataPickerViewDidCancel(_ pickerView: TTADataPickerView) {
        print(#function)
    }
}

