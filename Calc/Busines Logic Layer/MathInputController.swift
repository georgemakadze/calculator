//
//  MathInputController.swift
//  Calc
//
//  Created by Giorgi Makadze on 30.11.2022.
//

import Foundation

struct MathInputController {
    
    // MARK: - Operend  Editing Side
    
    enum OperendSide {
        case leftHandSide
        case rightHandSide
    }
    
    private var operendSide = OperendSide.leftHandSide
    
    // MARK: - Math Equation
    
    private(set) var mathEquation = MathEquation(lhs: .zero)
    
    // MARK: - LCD Display
    
    var lcdDisplayText = ""
    
    // MARK: - Initilaiser
    
    init() {
        lcdDisplayText = mathEquation.lhs.formatted()
    }
    
    // MARK: - Extra Function
    
    mutating func negatePressed() {
        switch operendSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            lcdDisplayText = mathEquation.lhs.formatted()
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            lcdDisplayText = mathEquation.rhs?.formatted() ?? "Error"
            
        }
        
    }
    
    mutating func percentagePressed() {
        switch operendSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftHandSide()
            lcdDisplayText = mathEquation.lhs.formatted()
        case .rightHandSide:
            mathEquation.applyPercentageToRightHandSide()
            lcdDisplayText = mathEquation.rhs?.formatted() ?? "Error"
        }
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.operation = .add
        operendSide = .rightHandSide
    }
    
    mutating func minusPressed() {
        mathEquation.operation = .subtract
        operendSide = .rightHandSide
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operendSide = .rightHandSide
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
        operendSide = .rightHandSide
    }
    
    mutating func execute() {
        mathEquation.execute()
       lcdDisplayText = mathEquation.result?.formatted() ?? "Error"
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        guard number >= -9, number <= 9 else { return }
        
        
        
        switch operendSide {
        case .leftHandSide:
            let tuple = appendNewNumber(number, toPreviousInput: mathEquation.lhs)
            mathEquation.lhs = tuple.newNumber
            lcdDisplayText = tuple.newLcdDisplayText
        case .rightHandSide:
            let tuple = appendNewNumber(number, toPreviousInput: mathEquation.rhs ?? .zero)
            mathEquation.rhs = tuple.newNumber
            lcdDisplayText = tuple.newLcdDisplayText
        }
        
    }
    
    private func appendNewNumber(_ number: Int, toPreviousInput previusInput: Decimal) -> (newNumber: Decimal, newLcdDisplayText: String) {
        let stringInput = String(number)
        var newStringRepresentation = previusInput.isZero ? "" : lcdDisplayText
        newStringRepresentation.append(stringInput)
        
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newStringRepresentation) else { return (.nan, "Error")}
        
        let newNumber = convertedNumber.decimalValue
        let newLCDDisplayText = newStringRepresentation
        return (newNumber, newLCDDisplayText)
        
        
    }
   
}
