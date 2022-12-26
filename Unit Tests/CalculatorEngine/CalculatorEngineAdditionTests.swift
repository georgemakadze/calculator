//
//  CalculatorEngineAdditionTests.swift
//  CalcTests
//
//  Created by Giorgi Makadze on 26.12.2022.
//

import XCTest
@testable import Calc

final class CalculatorEngineAdditionTests: XCTestCase {
    
    // MARK: - Equals Button
    
    func testPinPadNumberAndEquals() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)")
                
            }
        }
    }
    
    func testContinuousPinPadNumberAndEquals() throws {
        var calculatorEngine = CalculatorEngine()
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)")
                
            }
        }
    }
    
    // MARK: - Operation Buttons
    
    func testPinPadNumberAndOperation() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.addPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)")
                
            }
        }
    }
    
    func testContinuousPinPadNumberAndOperation() throws {
        
        for lhsPinPadNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(lhsPinPadNumber)
            calculatorEngine.addPressed()
            var result = lhsPinPadNumber
            
            for rhsPinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.addPressed()
                result = result + rhsPinPadNumber
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "\(result)")
                
            }
        }
    }
}
