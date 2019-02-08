//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let number = Double( displayLabel.text! ) else {
                fatalError("Cannot conver displayLabel.text to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(displayValue)
        }
    }
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let symbol = sender.currentTitle {
            
            
            if let result = calculator.performOperation(operation: symbol) {
                displayValue = result
            }
            
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numberPressed = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numberPressed
                isFinishedTypingNumber = false
            } else {
                
                if numberPressed == "." {
                    
                    if displayLabel.text!.contains(".") {
                        return
                    }
                    
                }
                
                displayLabel.text! += numberPressed
            }
            
//            if displayLabel.text! != "0" {
//                displayLabel.text! += numberPressed
//            } else {
//                displayLabel.text! = numberPressed
//            }
        }
    
    }

}

