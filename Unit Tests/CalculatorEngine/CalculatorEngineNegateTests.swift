//
//  CalculatorEngineNegateTests.swift
//  CalcTests
//
//  Created by Giorgi Makadze on 27.12.2022.
//

import XCTest
@testable import Calc

final class CalculatorEngineNegateTests: XCTestCase {
    
    // MARK: - Addition

    func testLHSNegateWithAddition() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(-lhsPinPadNumber + rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSNegateWithAddition() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber + -rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    // MARK: - Subtraction

    func testLHSNegateWithSubtraction() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(-lhsPinPadNumber - rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSNegateWithSubtraction() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber - -rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    // MARK: - Multiplication

    func testLHSNegateWithMultiplication() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(-lhsPinPadNumber * rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSNegateWithMultiplication() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber * -rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    // MARK: - Division

    func testLHSNegateWithDivision() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(-lhsPinPadNumber) / Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSNegateWithDivision() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) / Decimal(-rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }


}
