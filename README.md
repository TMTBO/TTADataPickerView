A Swift picker view allows you to pick the titles you want and the date, time or dateTime in one view

#ScreenShort

#Installation

TTADataPickerView is avaibale on CocoaPods.

* 1 Insatll with CocoaPods:

	```
	target 'MyApp' do
  		pod 'TTADataPickerView', '~> 0.1'
	end
	```
	>Then run a `pod install` inside you terminal
	
* 2 Manually
	> Clone the code from the github:
	
	`git clone https://github.com/TMTBO/TTADataPickerView.git`
	>Then drop the TTADataPickerView folder to your project
	
	`import TTADataPickerView`
	
#Features
* 1 Pick Data and date in one PickerView: 

	>You do not need to write UIDatePicker and UIPickerView
* 2 Configurable apperance: 

	>You can configure the PickerView's apperance as you want

#Usage

* 1 Initializer, you can configure the type and title
```
let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
```

* 2 Configure pickerView type with this property

	```
	pickerView.type = .text
	```
	> Some Other type
	
	```
	/// The component type of the TTADataPickerView
	public enum TTADataPickerViewType {
    	/// pickerView default
    	case text
    	/// datePicker
    	case date
    	/// date and time
    	case dateTime
   		/// time
    	case time
}
	```
		
* 3 Configure the delegate

	```
	// You need to confirm `TTADataPickerViewDelegate`
	
	pickerView.delegate = self
	```
* 4 When the pickerView type is .text, configure this property to tell the pickerView what you want to select

	```
	pickerView.textItemsForComponent = [["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]]
	```
* 5 Show the PickerView
	
	```
	pickerView.show()
	
	or
	
	pickerView.show { 
            // something you want to do after show the pickerView
        }
	```
	
* 6 Set the selectedTitles or selectedDate when the pickerView appers

	```
    pickerView.selectedTitles(titles)
    pickerView.selectedDate(date)
	```

* 7 Configure the TTADataPickerView's apperance

	```
	// config the TTADataPickerView's apperance
	let apperance = TTADataPickerView.appearance()
	apperance.setConfirmButtonAttributes(att: [NSForegroundColorAttributeName: UIColor.red])
	pperance.setCancelButtonAttributes(att: [NSForegroundColorAttributeName: UIColor.blue])
	apperance.setToolBarTintColor(color: .yellow)      apperance.setToolBarBarTintColor(color: .orange)
	apperance.setTitleFont(font: UIFont.systemFont(ofSize: 20))
	apperance.setTitleColor(color: .cyan)
	```
	
* 8 Delegate Functions

```
// MARK: - TTADataPickerViewDelegate

extension ViewController: TTADataPickerViewDelegate {
    // when the pickerView type is `.text`, you clicked the done button, you will get the titles you selected just now from the `titles` parameter
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectTitles titles: [String]) {
        showLabel.text = titles.joined(separator: " ")
    }
    // when the pickerView type is NOT `.text`, you clicked the done button, you will get the date you selected just now from the `date` parameters
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectDate date: Date) {
        // actually you need configure the dateFormatter dateStyle and timeStyle to get the currect date from the `date` parameter
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
    // when the pickerView  has been changed, this function will be called, and you will get the row and component which changed just now
    func dataPickerView(_ pickerView: TTADataPickerView, didChange row: Int, inComponent component: Int) {
        print(#function)
    }
    // when you clicked the cancel button, this function will be called firstly
    func dataPickerViewWillCancel(_ pickerView: TTADataPickerView) {
        print(#function)
    }
    // when you clicked the cancel button, this function will be called at the last
    func dataPickerViewDidCancel(_ pickerView: TTADataPickerView) {
        print(#function)
    }
}
```

