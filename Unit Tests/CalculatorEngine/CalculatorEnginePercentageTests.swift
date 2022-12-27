//
//  CalculatorEnginePercentageTests.swift
//  CalcTests
//
//  Created by Giorgi Makadze on 27.12.2022.
//

import XCTest
@testable import Calc

final class CalculatorEnginePercentageTests: XCTestCase {

    // MARK: - Addition

    func testLHSPercentageWithAddition() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) / Decimal(100) + Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSPercentageWithAddition() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) + Decimal(rhsPinPadNumber) / Decimal(100)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    // MARK: - Subtraction

    func testLHSPercentageWithSubtraction() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) / Decimal(100) - Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSPercentageWithSubtraction() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) - Decimal(rhsPinPadNumber) / Decimal(100)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    // MARK: - Multiplication

    func testLHSPercentageWithMultiplication() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) / Decimal(100) * Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSPercentageWithMultiplication() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) * Decimal(rhsPinPadNumber) / Decimal(100)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    // MARK: - Division

    func testLHSPercentageWithDivision() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                
                let expectedResult = (Decimal(lhsPinPadNumber) / Decimal(100)) / Decimal(rhsPinPadNumber)
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }
    
    func testRHSPercentageWithDivision() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                
                let expectedResult = Decimal(lhsPinPadNumber) / (Decimal(rhsPinPadNumber) / Decimal(100))
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted())
                
            }
        }
    }

}
