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
    
    // MARK: - Data Storage
    
    private var dataStore = DataStoreManager(key: "iOSBFree.com.Calc.ThemeManager.ThemeIndex")
    
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
        restoreSavedThemeIndex()
    }
    
    private func populateArrayOfThemes() {
        theme = [darkTheme, purpleTheme, bloodOrangeTheme, darkBlueTheme, electroTheme, lightBlueTheme, lightTheme, orangeTheme, pinkTheme, washedOutTheme]
    }
    
    // MARK: - Save & Restore Disk
    
    private func restoreSavedThemeIndex() {
        savedThemeIndex = 0
        
        if let previousThemeIndex = dataStore.getValue() as? Int {
            savedThemeIndex = previousThemeIndex
        }
       
        savedTheme = theme[savedThemeIndex]
    }
    
    private func saveThemeIndexToDisk() {
        dataStore.set(savedThemeIndex)
    }
    
    // MARK: - Next Theme
    
    func moveToNextTheme() {
        
        savedThemeIndex = savedThemeIndex + 1
        if savedThemeIndex > theme.count - 1 {
            savedThemeIndex = 0
        }
        
        savedTheme = theme[savedThemeIndex]
        saveThemeIndexToDisk()
    }
    
}
