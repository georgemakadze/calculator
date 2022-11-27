//
//  MathEquation.swift
//  Calc
//
//  Created by Giorgi Makadze on 25.11.2022.
//

import Foundation

struct MathEquation {
    
    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
    }
    
    var lhs: Decimal
    var rhs: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    mutating func execute() {
        
        guard
            let rhs = self.rhs,
            let operation = self.operation else {
            return
        }
        
        switch operation {
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        case .multiply:
            result = lhs * rhs
        case .divide:
            result = lhs / rhs
        
        }
    }
    
}
