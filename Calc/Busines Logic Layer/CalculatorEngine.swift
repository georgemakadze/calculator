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
    
    enum OperendSide {
        case leftHandSide
        case rightHandSide
    }
    // MARK: - LCD Display
    
    var lcdDisplayText = ""
    
    
    // MARK: - Math Equation
    
    private var mathEquation = MathEquation(lhs: .zero)
    private var operendSide = OperendSide.leftHandSide
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        mathEquation = MathEquation(lhs: .zero)
        lcdDisplayText = mathEquation.lhs.formatted()
        operendSide = .leftHandSide
    }
    
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
    
    mutating func equalsPressed() {
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
