//
//  CalculatorEngineNanTests.swift
//  CalcTests
//
//  Created by iOSBFree on 15/02/2022.
//
//
//  iOSBFree Ltd                    β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  π Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π iOSBFree
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
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
