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
    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }
        
        return savedTheme
    }
    
    // MARK: - Lifecycle
    
    init() {
        populateArrayOfThemes()
        restoreSavedTheme()
    }
    
    private func populateArrayOfThemes() {
        themes = [darkTheme]
    }
    
    // MARK: - Save & Restore Disk
    
    private func restoreSavedTheme() {
        guard let encodedTheme = dataStore.getValue() as? Data else {
            return
        }
        
        let decoder = JSONDecoder()
        if let previousTheme = try? decoder.decode(CalculatorTheme.self, from: encodedTheme) {
            savedTheme = previousTheme
        }
        
    }
    
    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        if let encodedTheme = try? encoder.encode(theme) {
            
            dataStore.set(encodedTheme)
        }
       
    }
    
    // MARK: - Next Theme
    
    func moveToNextTheme() {
        
        savedThemeIndex = savedThemeIndex + 1
        if savedThemeIndex > themes.count - 1 {
            savedThemeIndex = 0
        }
        
        let theme = themes[savedThemeIndex]
        savedTheme = theme
        saveThemeToDisk(theme)
    }
    
}
