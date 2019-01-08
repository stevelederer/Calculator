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
    
    let calculatorDisplayLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleToFill
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let clearButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.lightGray
        button.setTitle("AC", for: .normal)
        return button
    }()
    
    let plusMinusButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.lightGray
        button.setTitle("+/-", for: .normal)
        return button
    }()
    
    let percentButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.lightGray
        button.setTitle("%", for: .normal)
        return button
    }()
    
    let divideButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.orange
        button.setTitle("÷", for: .normal)
        return button
    }()
    
    let multiplyButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.orange
        button.setTitle("X", for: .normal)
        return button
    }()
    
    let subtractButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.orange
        button.setTitle("-", for: .normal)
        return button
    }()
    
    let addButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.orange
        button.setTitle("+", for: .normal)
        return button
    }()
    
    let equalsButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.orange
        button.setTitle("=", for: .normal)
        return button
    }()
    
    let nineButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("9", for: .normal)
        return button
    }()
    
    let eightButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("8", for: .normal)
        return button
    }()
    
    let sevenButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("7", for: .normal)
        return button
    }()
    
    let sixButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("6", for: .normal)
        return button
    }()
    
    let fiveButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("5", for: .normal)
        return button
    }()
    
    let fourButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("4", for: .normal)
        return button
    }()
    
    let threeButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("3", for: .normal)
        return button
    }()
    
    let twoButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("2", for: .normal)
        return button
    }()
    
    let oneButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("1", for: .normal)
        return button
    }()
    
    let zeroButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("0", for: .normal)
        return button
    }()
    
    let decimalButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle(".", for: .normal)
        return button
    }()
    
    var row1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    var row2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    var row3StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    var row4StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    var row5RightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    var row5WholeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    
    var allRowsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpViews()
    }
    
    // MARK: - Setup
    
    func setUpViews() {
        setUpButtons()
        setUpCalculatorDisplayView()
    }
    
    func setUpCalculatorDisplayView() {
        view.addSubview(calculatorDisplayLabel)
        calculatorDisplayLabel.text = "123456789"
        
        calculatorDisplayLabel.anchor(top: nil, bottom: allRowsStackView.topAnchor, left: allRowsStackView.leftAnchor, right: allRowsStackView.rightAnchor, paddingTop: 0, paddingBottom: 20, paddingLeft: 0, paddingRight: 0, width: 337.67, height: 95.67)
    }
    
    func setUpButtons() {
        view.addSubview(row1StackView)
        row1StackView.addArrangedSubview(clearButton)
        row1StackView.addArrangedSubview(plusMinusButton)
        row1StackView.addArrangedSubview(percentButton)
        row1StackView.addArrangedSubview(divideButton)
        view.addSubview(row2StackView)
        row2StackView.addArrangedSubview(sevenButton)
        row2StackView.addArrangedSubview(eightButton)
        row2StackView.addArrangedSubview(nineButton)
        row2StackView.addArrangedSubview(multiplyButton)
        view.addSubview(row3StackView)
        row3StackView.addArrangedSubview(fourButton)
        row3StackView.addArrangedSubview(fiveButton)
        row3StackView.addArrangedSubview(sixButton)
        row3StackView.addArrangedSubview(subtractButton)
        view.addSubview(row4StackView)
        row4StackView.addArrangedSubview(oneButton)
        row4StackView.addArrangedSubview(twoButton)
        row4StackView.addArrangedSubview(threeButton)
        row4StackView.addArrangedSubview(addButton)
        view.addSubview(row5RightStackView)
        row5RightStackView.addArrangedSubview(decimalButton)
        row5RightStackView.addArrangedSubview(equalsButton)
        view.addSubview(row5WholeStackView)
        row5WholeStackView.addArrangedSubview(zeroButton)
        row5WholeStackView.addArrangedSubview(row5RightStackView)
        view.addSubview(allRowsStackView)
        allRowsStackView.addArrangedSubview(row1StackView)
        allRowsStackView.addArrangedSubview(row2StackView)
        allRowsStackView.addArrangedSubview(row3StackView)
        allRowsStackView.addArrangedSubview(row4StackView)
        allRowsStackView.addArrangedSubview(row5WholeStackView)
        
        allRowsStackView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 277, paddingBottom: 31, paddingLeft: 18.6667, paddingRight: 18.6667, width: 337.67, height: 426)
    }
 /*
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
        buttonNotSelected(button: addButton)
        buttonNotSelected(button: subtractButton)
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
 */
}
