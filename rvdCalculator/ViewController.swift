//
//  ViewController.swift
//  rvdCalculator
//
//  Created by rvd on 1/28/18.
//  Copyright © 2018 rvd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
   
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
    let number = sender.currentTitle!
    if stillTyping {
      
     displayResultLabel.text = displayResultLabel.text! + number
     } else {
      displayResultLabel.text = number
     stillTyping = true
    }
    
    }
    

    @IBAction func twoOperandSignPresses(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
       // print (firstOperand)
        stillTyping = false
        
    }
   
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
      //  return currentInput
    }
   
    @IBAction func equalitySignPressd(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        switch operationSign {
        case "+" :
            operateWithTwoOperands{$0 + $1}
        case "-" :
            operateWithTwoOperands{$0 - $1}
        case "×" :
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}

        default:
            break
        }
    }
  
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0;
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        operationSign = ""
    
    }
  
    
    @IBAction func plusMinusButtonPressed(_ sender:UIButton ) {
        currentInput = -currentInput
    }
    
    @IBAction func percenttageButtonPressed(_ sender:UIButton ) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = secondOperand / 100
        }
    }

    @IBAction func squareButtonPressed(_ sender:UIButton ) {
        currentInput = sqrt(currentInput)
    }
    
    
    @IBAction func dotButtonPressed(_ sender:UIButton ) {
        
    }

}

