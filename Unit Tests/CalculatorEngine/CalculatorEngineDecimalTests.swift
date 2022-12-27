//
//  CalculatorEngineDecimalTests.swift
//  CalcTests
//
//  Created by iOSBFree on 15/02/2022.
//
//
//  iOSBFree Ltd                     → All rights reserved
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

class CalculatorEngineDecimalTests: XCTestCase {
    
    func testLHSDecimalPinPadNumbers() throws {
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = Decimal(lhsPinPadNumber) + (Decimal(lhsPinPadNumber) / 10)
                let rhs = Decimal(rhsPinPadNumber)
                let expectedResult = lhs + rhs
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSDecimalPinPadNumbers() throws {
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = Decimal(lhsPinPadNumber)
                let rhs = Decimal(rhsPinPadNumber) + (Decimal(rhsPinPadNumber) / 10)
                let expectedResult = lhs + rhs
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }
    
    func testLHSAndRHSDecimalPinPadNumbers() throws {
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = Decimal(lhsPinPadNumber) + (Decimal(lhsPinPadNumber) / 10)
                let rhs = Decimal(rhsPinPadNumber) + (Decimal(rhsPinPadNumber) / 10)
                let expectedResult = lhs + rhs
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }
}
