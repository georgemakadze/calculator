//
//  ThemeManager.swift
//  Calc
//
//  Created by Giorgi Makadze on 02.12.2022.
//

import Foundation

class ThemeManager {
    
    // MARK: - Singleton
    
    static let shared = ThemeManager()
    
    // MARK: - Themes
    
    private var savedThemeIndex = 0
    private(set) var theme: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return theme.first ?? darkTheme
        }
        
        return savedTheme
    }
    
    // MARK: - Lifecycle
    
    init() {
        populateArrayOfThemes()
    }
    
    private func populateArrayOfThemes() {
        theme = [darkTheme, purpleTheme, bloodOrangeTheme, darkBlueTheme, electroTheme, lightBlueTheme, lightTheme, orangeTheme, pinkTheme, washedOutTheme]
    }
    
    // MARK: - Next Theme
    
    func moveToNextTheme() {
        
        savedThemeIndex = savedThemeIndex + 1
        if savedThemeIndex > theme.count - 1 {
            savedThemeIndex = 0
        }
        
        savedTheme = theme[savedThemeIndex]
    }
    
}
