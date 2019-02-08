//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Unprivileged on 2/7/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit


struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (operation: String, firstNumber: Double)?
    
    private func performTwoNumberCalculation(secondNumber: Double) -> Double? {
        if let firstNumber = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.operation {
            switch operation {
                case "+":
                    return firstNumber + secondNumber
                case "-":
                    return firstNumber - secondNumber
                case "*":
                    return firstNumber * secondNumber
                case "/":
                    return firstNumber / secondNumber
                default:
                    fatalError("Could not complete performTwoNumberCalculation in struct CalculatorLogic")
            }
        }
        return nil
    }
    
    mutating func setNumber(_ newNumber: Double) {
        self.number = newNumber
    }
    
    mutating func performOperation(operation: String) -> Double? {
        
        if let n = number {
            switch operation {
                case "+/-": return n * -1
                case "AC": return 0
                case "%": return n / 100
                case "=": return performTwoNumberCalculation(secondNumber: n)
                default: intermediateCalculation = (operation: operation, firstNumber: n)
            }
        }
        
        return nil
    }
    
    
    
    
    
    
}
