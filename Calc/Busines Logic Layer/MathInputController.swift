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
        
        let decimalValue = Decimal(number)
        lcdDisplayText = decimalValue.formatted()
        
        switch operendSide {
        case .leftHandSide:
            mathEquation.lhs = decimalValue
        case .rightHandSide:
            mathEquation.rhs = decimalValue
        }
        
    }
    
   
}
