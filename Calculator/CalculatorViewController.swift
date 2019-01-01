//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Steve Lederer on 12/24/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    var userIsTypingNumber = false
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = 0.0
    var operation = ""
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var calculatorDisplayLabel: UILabel!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Setup
    
    func buttonSelected(button: UIButton) {
        button.isSelected = true
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitleColor(#colorLiteral(red: 0.9896442294, green: 0.6666129231, blue: 0, alpha: 1), for: .selected)
    }
    
    func buttonNotSelected(button: UIButton) {
        button.isSelected = false
        button.backgroundColor = #colorLiteral(red: 0.9896442294, green: 0.6666129231, blue: 0, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
    
    func deselectAllButtons() {
        buttonNotSelected(button: plusButton)
        buttonNotSelected(button: minusButton)
        buttonNotSelected(button: divideButton)
        buttonNotSelected(button: multiplyButton)
    }
    
    // MARK: - Actions
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        deselectAllButtons()
        guard let currentLabelText = calculatorDisplayLabel.text else { return }
        guard let numberTapped = sender.currentTitle else { return }
        if userIsTypingNumber {
            calculatorDisplayLabel.text = currentLabelText + numberTapped
            //            print("Number on screen: \(currentLabelText + numberTapped)")
        } else {
            clearButton.setTitle("C", for: .normal)
            userIsTypingNumber = true
            calculatorDisplayLabel.text = numberTapped
            //            print("Number on screen: \(numberTapped)")
        }
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        userIsTypingNumber = false
        guard let textFromLabel = calculatorDisplayLabel.text, let numberAsDouble = Double(textFromLabel) else { return }
        let switchSign = numberAsDouble * -1
        calculatorDisplayLabel.text = "\(switchSign)"
        //        print("Switch sign! Number on screen: \(switchSign)")
    }
    
    @IBAction func percentButtonTapped(_ sender: UIButton) {
        userIsTypingNumber = false
        guard let textFromLabel = calculatorDisplayLabel.text, let numberAsDouble = Double(textFromLabel) else { return }
        let percentage = numberAsDouble / 100
        calculatorDisplayLabel.text = "\(percentage)"
        //        print("Percent! Number on screen: \(percentage)")
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        userIsTypingNumber = false
        if sender.isSelected == false {
            deselectAllButtons()
            buttonSelected(button: sender)
        }
        guard let textFromLabel = calculatorDisplayLabel.text, let numberAsDouble = Double(textFromLabel) else { return }
        firstNumber = numberAsDouble
        guard let newOperation = sender.currentTitle else { return }
        operation = newOperation
        print("Operation: " + operation + "\nFirst Number is \(firstNumber)")
    }
    
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        userIsTypingNumber = false
        deselectAllButtons()
        guard let textFromLabel = calculatorDisplayLabel.text, let secondNumberAsDouble = Double(textFromLabel) else { return }
        secondNumber = secondNumberAsDouble
        print("Equals! First Number: \(firstNumber); Second Number: \(secondNumber)")
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "–" {
            result = firstNumber - secondNumber
        } else if operation == "Ｘ" {
            result = firstNumber * secondNumber
        } else if operation == "÷" {
            result = firstNumber / secondNumber
        } else if operation.isEmpty {
            result = secondNumber
        }
        
        print("Result: \(result)")
        
        if result.isNaN {
            calculatorDisplayLabel.text = "Error"
            return
        } else {
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                let intResult = Int(result)
                calculatorDisplayLabel.text = "\(intResult)"
            } else {
                calculatorDisplayLabel.text = "\(result)"
            }
            firstNumber = result
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        firstNumber = 0
        secondNumber = 0
        operation = ""
        deselectAllButtons()
        calculatorDisplayLabel.text = "0"
        clearButton.setTitle("AC", for: .normal)
        userIsTypingNumber = false
    }
}
