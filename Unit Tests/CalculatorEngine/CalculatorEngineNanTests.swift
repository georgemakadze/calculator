//
//  CalculatorEngineNanTests.swift
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

class CalculatorEngineNanTests: XCTestCase {

    func testNan() throws {
        
        for lhsPinPadNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            
            calculatorEngine.pinPadPressed(lhsPinPadNumber)
            calculatorEngine.dividePressed()
            calculatorEngine.pinPadPressed(0)
            calculatorEngine.equalsPressed()
            
            XCTAssertTrue(calculatorEngine.lcdDisplayText == "Error")
        }
    }

}
