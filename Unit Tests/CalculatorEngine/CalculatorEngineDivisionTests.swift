//
//  CalculatorEngineDivisionTests.swift
//  CalcTests
//
//  Created by iOSBFree on 15/02/2022.
//
//
//  iOSBFree Ltd                    → All rights reserved
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
//  💚 iOSBFree
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's our testing team! They are testing our math!
//
// *******************************************************************************************


import XCTest
@testable import Calc

class CalculatorEngineDivisionTests: XCTestCase {
      
    // MARK: - Equals Button
    
    func testPinPadNumberAndEquals() throws {
        // NOTE: We test dividing by zero in a separate Unit Test Case Class
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == (Decimal(lhsPinPadNumber) / Decimal(rhsPinPadNumber)).formatted())
            }
        }
    }
    
    func testContinuousPinPadNumberAndEquals() throws {
        // NOTE: We test dividing by zero in a separate Unit Test Case Class
        
        var calculatorEngine = CalculatorEngine()
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == (Decimal(lhsPinPadNumber) / Decimal(rhsPinPadNumber)).formatted())
            }
        }
    }
    
    // MARK: - Operation Buttons
    
    func testPinPadNumberAndOperation() throws {
        // NOTE: We test dividing by zero in a separate Unit Test Case Class
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.dividePressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == (Decimal(lhsPinPadNumber) / Decimal(rhsPinPadNumber)).formatted())
            }
        }
    }
    
    func testContinuousPinPadNumberAndOperation() throws {
        // NOTE: We test dividing by zero in a separate Unit Test Case Class
        
        for lhsPinPadNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(lhsPinPadNumber)
            calculatorEngine.dividePressed()
            var result: Decimal = Decimal(lhsPinPadNumber)
            
            for rhsPinPadNumber in 1...9 {
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.dividePressed()
                result = result / Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == result.formatted())
            }
        }
    }
    
}
