//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Serhii Onyshchenko on 26.07.2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        }
        if symbol == "AC" {
            return 0
        }
        if symbol == "%" {
            return number / 100
        }
        return nil
    }
    
}
