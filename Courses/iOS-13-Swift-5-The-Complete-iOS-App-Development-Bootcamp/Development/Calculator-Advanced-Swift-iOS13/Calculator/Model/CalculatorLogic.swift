//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Serhii Onyshchenko on 26.07.2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }
            if symbol == "AC" {
                return 0
            }
            if symbol == "%" {
                return n / 100
            }
        }
        return nil
    }
    
}
