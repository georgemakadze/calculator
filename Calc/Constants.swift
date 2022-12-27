//
//  Constants.swift
//  Calc
//
//  Created by Giorgi Makadze on 27.12.2022.
//

import Foundation
import UIKit

extension UIImage {
    struct keys {
        static let circleSliced = "CircleSliced"
        static let circle = "Circle"
    }
}

// MARK: - LCDDisplay

extension LCDDisplay {
    struct keys {
        static let historyLogNotification = "IOSBFree.com.calc.LCDDisplay.displayHistory"
        static let pasteNumberNotification = "IOSBFree.com.Calc.LCDDisplay.pasteNumber"
        static let pasteNumberKey = "PasteKey"
    }
}

// MARK: - LogViewController

extension LogViewController {
    struct keys {
        static let pasteEquationNotification = "IOSBFree.com.Calc.LogViewController.pasteMathEquation"
        static let pasteNumberKey = "PasteKey"
    }
}

// MARK: - UIStoryboard

extension UIStoryboard {
    struct keys {
        static let mainStoryboard = "Main"
        static let logViewController = "LogViewController"
    }
}

// MARK: - ThemeManeger

extension ThemeManager {
    struct keys {
        static let dataStore = "iOSBFree.com.Calc.ThemeManager.ThemeIndex"
    }
}
