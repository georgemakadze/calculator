//
//  CalculatorEngineClearTests.swift
//  CalcTests
//
//  Created by Giorgi Makadze on 27.12.2022.
//

import XCTest
@testable import Calc

final class CalculatorEngineClearTests: XCTestCase {
    
    
    func testClear() throws {
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.minusPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
                
                calculatorEngine.pinPadPressed(lhsPinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
               
            }
        }
    }

   
}
