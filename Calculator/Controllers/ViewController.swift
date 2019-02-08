//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFirstNumberZero: Bool = true
    
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let number = Double( displayLabel.text! ) else {
                fatalError("Cannot convert displayLabel.text to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(displayValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFirstNumberZero = true
        calculator.setNumber(displayValue)
        
        if let symbol = sender.currentTitle {
            if let result = calculator.performOperation(operation: symbol) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numberPressed = sender.currentTitle {
            if isFirstNumberZero {
                displayLabel.text = numberPressed
                isFirstNumberZero = false
            } else {
                if numberPressed == "." && !displayLabel.text!.contains(".") {
                    displayLabel.text! += numberPressed
                }
            }
        }
    
    }

}

