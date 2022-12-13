///
//  LCDDisplay.swift
//  Calc
//
//  Created by iOSBFree on 25/01/2022.
//
//  iOSBFree Ltd                    → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏽 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  💛 iOSBFree
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a subclass. This is our label to display input and the results of equations.
//   Architectural Layer: Presentation Layer
//
// *******************************************************************************************



import UIKit

class LCDDisplay: UIView {
    
    //MARK: - IBOutlets
    
    @IBOutlet var label: UILabel!
    
    // MARK: - Initialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        layer.cornerRadius = 20
        addMenuGestureRecogniser()
    }
    
    // MARK: - Gesture Recogniser
    
    private func  addMenuGestureRecogniser() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureEventFired(_:)))
        addGestureRecognizer(longPressGesture)
    }
    
    @objc private func longPressGestureEventFired(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            showMenu(from: gesture)
        default:
            
            break
        }
        
    }
    
    // MARK: - UIMenuController
    
    private func showMenu(from gestureRecogniser: UILongPressGestureRecognizer) {
        registerNotifications()
        highlightScreen()
        becomeFirstResponder()
        
        let menu = UIMenuController.shared
        guard menu.isMenuVisible == false else { return }
        
        let locationOfTouch = gestureRecogniser.location(in: self)
        var rect = bounds
        rect.origin = locationOfTouch
        rect.origin.y = rect.origin.y - 20
        rect.size = CGSize(width: 1, height: 44)
        menu.showMenu(from: self, rect: rect)
    }
    
    private func hideMenu() {
        UIMenuController.shared.hideMenu(from: self)
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.paste(_:))
    }
    
    @objc override func copy(_ sender: Any?) {
        UIPasteboard.general.string = label.text
    }
    
    override func paste(_ sender: Any?) {
        guard let numberToPaste = UIPasteboard.general.string?.doubleValue else { return }
        
        let userInfo: [AnyHashable: Any] = ["PasteKey": numberToPaste]
        NotificationCenter.default.post(name: Notification.Name("IOSBFree.com.Calc.LCDDisplay.pasteNumber"), object: nil, userInfo: userInfo)
    }
    
    // MARK: - Color Theme
    
    func prepareForColorThemeUptade() {
        unhighlightScreen(animated: false)
        hideMenu()
    }
    
    // MARK: - Animations
    
    private func highlightScreen() {
        let theme = ThemeManager.shared.currentTheme
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.label.backgroundColor = UIColor(hex: theme.operationColor)
            self?.label.textColor = UIColor(hex: theme.operationTitleColor)
        } completion: { _ in
            
        }
    }
    
    private func unhighlightScreen(animated: Bool) {
        let theme = ThemeManager.shared.currentTheme
        
        let duration = animated ? 0.15 : 0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.label.backgroundColor = UIColor.clear
            self?.label.textColor = UIColor(hex: theme.displayColor)
        } completion: { _ in
            
        }
    }
    
    // MARK: - Notifications
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.willHideEditMenu(_:)), name: UIMenuController.willHideMenuNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIMenuController.willHideMenuNotification, object: nil)
    }
    
    @objc private func willHideEditMenu(_ notification: Notification) {
        unhighlightScreen(animated: true)
        unregisterNotifications()
    }
}


