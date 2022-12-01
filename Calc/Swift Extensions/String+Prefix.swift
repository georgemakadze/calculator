//
//  String+Prefix.swift
//  Calc
//
//  Created by Giorgi Makadze on 01.12.2022.
//

import Foundation

extension String {
    
    mutating func addPrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) == false else { return }
        
        self = prefix + self
    }
    
    mutating func removePrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) else { return }
        
        self = replacingOccurrences(of: prefix, with: "")
    }
}
