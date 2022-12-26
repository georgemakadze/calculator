//
//  CalculatorEngineMultiplicationTests.swift
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

class CalculatorEngineMultiplicationTests: XCTestCase {
    
    // MARK: - Equals Button
    
    func testPinPadNumberAndEquals() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber * rhsPinPadNumber)")
            }
        }
    }
    
    func testContinuousPinPadNumberAndEquals() throws {
        var calculatorEngine = CalculatorEngine()
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber * rhsPinPadNumber)")
            }
        }
    }
    
    // MARK: - Operation Buttons
    
    func testPinPadNumberAndOperation() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber * rhsPinPadNumber)")
            }
        }
    }
    
    func testContinuousPinPadNumberAndOperation() throws {
        
        for lhsPinPadNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(lhsPinPadNumber)
            calculatorEngine.multiplyPressed()
            var result = lhsPinPadNumber
            
            for rhsPinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                result = result * rhsPinPadNumber
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(result)")
            }
        }
    }
    
}
