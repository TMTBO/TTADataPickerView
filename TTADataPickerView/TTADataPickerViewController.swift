//
//  TTADataPickerViewController.swift
//  TTAUtils_Swift
//
//  Created by TobyoTenma on 12/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import UIKit

/// This Controller is used for SHOW and DISMISS the DataPickerView instance
/// User should NOT use it to show or dismiss

internal final class TTADataPickerViewController: UIViewController {
    
    /// DataPickerView
    weak var pickerView: TTADataPickerView? = nil
    
    deinit {
        #if DEBUG
        print("\(NSStringFromClass(type(of: self))) deinit")
        #endif
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - LifeCycle

extension TTADataPickerViewController {
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(tap:)))
        view.addGestureRecognizer(tap)
        tap.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Public Functions

extension TTADataPickerViewController {
    
    /// Show pickerView animation
    ///
    /// - Parameters:
    ///   - pickerView: pickerView
    ///   - completion: complection handler
    func showPickerView(pickerView: TTADataPickerView, completion: (() -> Void)? = nil) {
        
        // Get the top viewController
        self.pickerView = pickerView
        var topController = UIApplication.shared.keyWindow?.rootViewController
        while (topController?.presentedViewController != nil) {
            topController = topController?.presentedViewController
        }
        topController?.resignFirstResponder()
        
        // Put the pickerView at the bottom of the screen
        pickerView.frame.origin.y = view.bounds.size.height
        view.addSubview(pickerView)
        
        // Set this controller as a childViewController of the topController,
        // Add put it's view as a subView of the topController's view
        view.frame = CGRect(x: 0, y: 0, width: topController?.view.bounds.width ?? 0, height: topController?.view.bounds.height ?? 0)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        topController?.addChildViewController(self)
        topController?.view.addSubview(self.view)
        
        // Show anmiation
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { 
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
            pickerView.frame.origin.y = self.view.bounds.size.height - pickerView.frame.size.height
        }) { (_) in
            guard let handle = completion else { return }
            handle()
        }
    }
    
    /// Dismiss the pickerView
    ///
    /// - Parameter completion: completion handler
    func dismissWithCompletion(completion: (() -> Void)? = nil) {
        // Hide with animation.
        
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { 
            self.view.backgroundColor  = .clear
            self.pickerView?.frame.origin.y = self.view.bounds.size.height
        }) { (_) in
            // Remove pickerView, self.view and self
            self.pickerView?.removeFromSuperview()
            self.willMove(toParentViewController: nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            
            guard let handle = completion else { return }
            handle()
        }
    }
}

// MARK: - Actions
fileprivate extension TTADataPickerViewController {
    
    /// Tap gesture action
    ///
    /// - Parameter tap: Tap gesture
    @objc func tap(tap: UITapGestureRecognizer) {
        if (tap.state == UIGestureRecognizerState.ended) {
            //Code to handle the gesture
            dismissWithCompletion()
        }
    }
    
}

// MARK: - UIGestureRecognizerDelegate

extension TTADataPickerViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let isContains = pickerView?.bounds.contains(touch.location(in: pickerView)), isContains == true else { return true }
        return false
    }
}
