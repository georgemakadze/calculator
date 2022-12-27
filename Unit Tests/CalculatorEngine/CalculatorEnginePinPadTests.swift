//
//  CalculatorEnginePinPadTests.swift
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

class CalculatorEnginePinPadTests: XCTestCase {

    func testLargePinPadNumbersWithAddition() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = (lhsPinPadNumber * 10 * 10 * 10) + (lhsPinPadNumber * 10 * 10) + (lhsPinPadNumber * 10) + lhsPinPadNumber
                let rhs = (rhsPinPadNumber * 10 * 10 * 10) + (rhsPinPadNumber * 10 * 10) + (rhsPinPadNumber * 10) + rhsPinPadNumber
                let expectedResult = lhs + rhs
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }
    
    func testLargePinPadNumbersWithSubtraction() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = (lhsPinPadNumber * 10 * 10 * 10) + (lhsPinPadNumber * 10 * 10) + (lhsPinPadNumber * 10) + lhsPinPadNumber
                let rhs = (rhsPinPadNumber * 10 * 10 * 10) + (rhsPinPadNumber * 10 * 10) + (rhsPinPadNumber * 10) + rhsPinPadNumber
                let expectedResult = lhs - rhs
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }
    
    func testLargePinPadNumbersWithMultiplication() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = (lhsPinPadNumber * 10 * 10 * 10) + (lhsPinPadNumber * 10 * 10) + (lhsPinPadNumber * 10) + lhsPinPadNumber
                let rhs = (rhsPinPadNumber * 10 * 10 * 10) + (rhsPinPadNumber * 10 * 10) + (rhsPinPadNumber * 10) + rhsPinPadNumber
                let expectedResult = lhs * rhs
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }

    func testLargePinPadNumbersWithDivision() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let lhs = (lhsPinPadNumber * 10 * 10 * 10) + (lhsPinPadNumber * 10 * 10) + (lhsPinPadNumber * 10) + lhsPinPadNumber
                let rhs = (rhsPinPadNumber * 10 * 10 * 10) + (rhsPinPadNumber * 10 * 10) + (rhsPinPadNumber * 10) + rhsPinPadNumber
                let expectedResult = Decimal(lhs) / Decimal(rhs)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
            }
        }
    }
}
