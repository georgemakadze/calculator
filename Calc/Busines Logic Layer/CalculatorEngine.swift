//
//  CalculatorEngine.swift
//  Calc
//
//  Created by iOSBFree on 25/01/2022.
//
//
//  iOSBFree Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  💜 iOSBFree
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's the core of the calculator. The brain. It generates all of our behaviour.
//   Architecural Layer: Business Logic Layer
//
// *******************************************************************************************


import Foundation

struct CalculatorEngine {
    
    // MARK: - Input Controller
    
    private var inputController = MathInputController()
    
    // MARK: - Equation History
    
    private(set) var historyLog: [MathEquation] = []
    
    // MARK: - Data Storage
    
    private var dataStore = DataStoreManager(key: CalculatorEngine.keys.dataStore)
    
    // MARK: - LCD Display
    
    var lcdDisplayText: String  {
        return inputController.lcdDisplayText
    }
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        inputController = MathInputController()
        deletePreviousSession()
        
    }
    
    mutating func negatePressed() {
        populateFromResultIfNeeded()
        
        inputController.negatePressed()
    }
    
    mutating func percentagePressed() {
        populateFromResultIfNeeded()
        
        inputController.percentagePressed()
    }
    
    
    // MARK: - Operations
    
    mutating func addPressed() {
        executeAndPopulateFromResultIfNeeded()
        
        inputController.addPressed()
    }
    
    mutating func minusPressed() {
        executeAndPopulateFromResultIfNeeded()
        
        inputController.minusPressed()
    }
    
    mutating func multiplyPressed() {
        executeAndPopulateFromResultIfNeeded()
        
        inputController.multiplyPressed()
    }
    
    mutating func dividePressed() {
        executeAndPopulateFromResultIfNeeded()
        
        inputController.dividePressed()
    }
    
    mutating func equalsPressed() {
        if inputController.isCompleted {
            inputController = MathInputController(byPopulatingCalculationFrom: inputController)
        }
        
        guard inputController.isReadyToExecute else { return }
        executeMathInputController()
        
    }
    
    private mutating func executeMathInputController() {
        inputController.execute()
        historyLog.append(inputController.mathEquation)
        printEquationToDebugConsole()
        saveSession()
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        
        inputController.decimalPressed()
    }
    
    mutating func pinPadPressed(_ number: Int) {
        guard number >= 0,
              number <= 9 else { return }
        
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        
        inputController.pinPadPressed(number)
    }
    // MARK: - Populate New Math Input Controller
    
    private mutating func populateFromResult() {
        inputController = MathInputController(byPopulatingResultFrom: inputController)
    }
    
    private mutating func populateFromResultIfNeeded() {
        if inputController.isCompleted {
            populateFromResult()
        }
    }
    
    private mutating func executeAndPopulateFromResultIfNeeded() {
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        
        populateFromResultIfNeeded()
    }
    
    //MARK: - Debug Console
    
    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.generatePrintout())
    }
    
    // MARK: - History Log
    
    private mutating func clearHistory() {
        historyLog = []
    }
    
    // MARK: - Copy & Paste
    
    mutating func pasteInNumber(from decimal: Decimal) {
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        
        inputController.pasteIn(decimal)
        
    }
    
    mutating func pasteInMathEquation(from mathEquation: MathEquation) {
        guard let result = mathEquation.result else {
            return
        }
        
        inputController = MathInputController()
        pasteInNumber(from: result)
        
    }
    
    // MARK: - Restoring Session
    
    private func deletePreviousSession() {
        dataStore.deleteValue()
    }
    
    private func saveSession() {
        guard isMathInputControllerSafeToBeSaved() else {
            deletePreviousSession()
            return
        }
        
        let mathEquation = inputController.mathEquation
        let encoder = JSONEncoder()
        if let encodedEquation = try? encoder.encode(mathEquation) {
            
            dataStore.set(encodedEquation)
        }
        
    }
    
    mutating func restoreFromLastSession() -> Bool {
        guard let encodedEquation = dataStore.getValue() as? Data else {
            return false
        }
        
        let decoder = JSONDecoder()
        if let previousEquation = try? decoder.decode(MathEquation.self, from: encodedEquation) {
            inputController = MathInputController(byRestoringFrom: previousEquation)
            return true
        }
        return false
    }
    
    private func isMathInputControllerSafeToBeSaved() -> Bool {
        return !inputController.containsNans
    }
}

    


