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
    var SecondOperand: Double = 0
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
        currentInput = operation(firstOperand, SecondOperand)
        stillTyping = false
      //  return currentInput
    }
   
    @IBAction func equalitySignPressd(_ sender: UIButton) {
        if stillTyping {
            SecondOperand = currentInput
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
    }
  
    
    @IBAction func plusMinusButtonPressed(_ sender:UIButton ) {
        
    }
    
    @IBAction func percenttageButtonPressed(_ sender:UIButton ) {
        
    }

    @IBAction func squareButtonPressed(_ sender:UIButton ) {
        
    }

}

