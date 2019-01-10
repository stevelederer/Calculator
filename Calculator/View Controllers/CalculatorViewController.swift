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
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let clearButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "LightGrayButtonColor")
        button.setTitle("AC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(clearButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let plusMinusButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "LightGrayButtonColor")
        button.setTitle("+/-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(plusMinusButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let percentButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "LightGrayButtonColor")
        button.setTitle("%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(percentButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let divideButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "OrangeButtonColor")
        button.setTitle("÷", for: .normal)
        button.addTarget(self, action: #selector(operationButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let multiplyButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "OrangeButtonColor")
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(operationButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let subtractButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "OrangeButtonColor")
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(operationButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let addButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "OrangeButtonColor")
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(operationButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let equalsButton: RoundButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor(named: "OrangeButtonColor")
        button.setTitle("=", for: .normal)
        button.addTarget(self, action: #selector(equalsButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let nineButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("9", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let eightButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("8", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let sevenButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("7", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let sixButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("6", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let fiveButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("5", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let fourButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("4", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let threeButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("3", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let twoButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("2", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let oneButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("1", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let zeroButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("0", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let decimalButton: RoundButton = {
        let button = RoundButton()
        button.setTitle(".", for: .normal)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    var row1StackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        return stackView
    }()
    
    var row2StackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        return stackView
    }()
    
    var row3StackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        return stackView
    }()
    
    var row4StackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        return stackView
    }()
    
    var row5RightStackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        return stackView
    }()
    
    var row5WholeStackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        return stackView
    }()
    
    var allRowsStackView: CalculatorStackView = {
        let stackView = CalculatorStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateFadeInButtonsOnLoad()
    }
    
    // MARK: - UIImpactFeedbackGenerator
    
    let impact = UIImpactFeedbackGenerator()
    
    // MARK: - Setup
    
    func setUpViews() {
        setUpButtons()
        setUpCalculatorDisplayView()
    }
    
    func setUpCalculatorDisplayView() {
        view.addSubview(calculatorDisplayLabel)
        calculatorDisplayLabel.text = "0"
        
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
    
    func animateFadeInButtonsOnLoad() {
        self.row1StackView.alpha = 0
        self.row2StackView.alpha = 0
        self.row3StackView.alpha = 0
        self.row4StackView.alpha = 0
        self.row5WholeStackView.alpha = 0
        self.calculatorDisplayLabel.alpha = 0
        
        
        UIView.animate(withDuration: 1.3, delay: 0, options: [], animations: {
            self.row1StackView.alpha = 1
            self.row3StackView.alpha = 1
            self.row5WholeStackView.alpha = 1
//            let transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            self.clearButton.transform = transform
//            self.clearButton.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 1.3, delay: 0.2, options: [], animations: {
            self.row2StackView.alpha = 1
            self.row4StackView.alpha = 1
            self.calculatorDisplayLabel.alpha = 1
        }, completion: nil)
    }
 
    func buttonSelected(button: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            button.backgroundColor = .white
            button.setTitleColor(UIColor(named: "OrangeButtonColor"), for: .normal)
            
        }) { (success) in
            button.isSelected = true
        }
//        button.backgroundColor = .white
//        button.setTitleColor(UIColor(named: "OrangeButtonColor"), for: .selected)
    }
    
    func buttonNotSelected(button: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            button.backgroundColor = UIColor(named: "OrangeButtonColor")
            button.setTitleColor(.white, for: .normal)
        }) { (success) in
            button.isSelected = false
        }
    }
    
    func deselectAllButtons() {
        buttonNotSelected(button: addButton)
        buttonNotSelected(button: subtractButton)
        buttonNotSelected(button: divideButton)
        buttonNotSelected(button: multiplyButton)
    }
    
    // MARK: - Actions
    
    @objc func numberButtonTapped(_ sender: UIButton) {
        deselectAllButtons()
        impact.impactOccurred()
        let sizeTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.backgroundColor = UIColor(named: "LightGrayButtonColor")
            sender.transform = sizeTransform
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
                sender.backgroundColor = UIColor(named: "DarkGrayButtonColor")
                sender.transform = .identity
            }, completion: nil)
        }
        
        guard let currentLabelText = calculatorDisplayLabel.text else { return }
        guard let numberTapped = sender.currentTitle else { return }
        if userIsTypingNumber {
            let displayAnimation: CATransition = CATransition()
            displayAnimation.duration = 0.2
            displayAnimation.type = .reveal
            displayAnimation.subtype = CATransitionSubtype.fromBottom
            calculatorDisplayLabel.layer.add(displayAnimation, forKey: "changeCalculatorDisplayAnimation")
            calculatorDisplayLabel.text = currentLabelText + numberTapped
        } else {
            userIsTypingNumber = true
            let displayAnimation: CATransition = CATransition()
            displayAnimation.duration = 0.2
            displayAnimation.type = .reveal
            displayAnimation.subtype = CATransitionSubtype.fromBottom
            calculatorDisplayLabel.layer.add(displayAnimation, forKey: "changeCalculatorDisplayAnimation")
            calculatorDisplayLabel.text = numberTapped
            
            let clearButtonAnimation: CATransition = CATransition()
            clearButtonAnimation.duration = 0.2
            clearButtonAnimation.type = .fade
            clearButton.layer.add(clearButtonAnimation, forKey: "changeClearButtonTextTransition")
            clearButton.setTitle("C", for: .normal)
            
        }
    }
    
    @objc func plusMinusButtonTapped(_ sender: UIButton) {
        impact.impactOccurred()
        
        let sizeTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.backgroundColor = .white
            sender.transform = sizeTransform
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
                sender.backgroundColor = UIColor(named: "LightGrayButtonColor")
                sender.transform = .identity
            }, completion: nil)
        }
        
        userIsTypingNumber = false
        guard let textFromLabel = calculatorDisplayLabel.text, let numberAsDouble = Double(textFromLabel) else { return }
        let switchSign = numberAsDouble * -1
        calculatorDisplayLabel.text = "\(switchSign)"
    }
    
    @objc func percentButtonTapped(_ sender: UIButton) {
        impact.impactOccurred()
        
        let sizeTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.backgroundColor = .white
            sender.transform = sizeTransform
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
                sender.backgroundColor = UIColor(named: "LightGrayButtonColor")
                sender.transform = .identity
            }, completion: nil)
        }
        
        userIsTypingNumber = false
        guard let textFromLabel = calculatorDisplayLabel.text, let numberAsDouble = Double(textFromLabel) else { return }
        let percentage = numberAsDouble / 100
        calculatorDisplayLabel.text = "\(percentage)"
    }
    
    @objc func operationButtonTapped(_ sender: UIButton) {
        impact.impactOccurred()
        userIsTypingNumber = false
        
        let sizeTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.transform = sizeTransform
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
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
    
    @objc func equalsButtonTapped(_ sender: UIButton) {
        impact.impactOccurred()
        userIsTypingNumber = false
        
        let sizeTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.transform = sizeTransform
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
        deselectAllButtons()
        guard let textFromLabel = calculatorDisplayLabel.text, let secondNumberAsDouble = Double(textFromLabel) else { return }
        secondNumber = secondNumberAsDouble
        print("Equals! First Number: \(firstNumber); Second Number: \(secondNumber)")
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "X" {
            result = firstNumber * secondNumber
        } else if operation == "÷" {
            result = firstNumber / secondNumber
        } else if operation.isEmpty {
            result = secondNumber
        }
        
        print("Result: \(result)")
        let displayAnimation: CATransition = CATransition()
        displayAnimation.duration = 0.30
        displayAnimation.type = .moveIn
        displayAnimation.subtype = CATransitionSubtype.fromRight
        calculatorDisplayLabel.layer.add(displayAnimation, forKey: "changeCalculatorDisplayAnimationOnEqualsButtonTapped")
        
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
    
    @objc func clearButtonTapped(_ sender: UIButton) {
        impact.impactOccurred()
        
        let sizeTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.backgroundColor = .white
            sender.transform = sizeTransform
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
                sender.backgroundColor = UIColor(named: "LightGrayButtonColor")
                sender.transform = .identity
            }, completion: nil)
        }
        
        firstNumber = 0
        secondNumber = 0
        operation = ""
        deselectAllButtons()
        
        let animation: CATransition = CATransition()
        animation.duration = 0.3
        animation.type = .fade
        calculatorDisplayLabel.layer.add(animation, forKey: "clearDisplayLabel")
        
        calculatorDisplayLabel.text = "0"
        clearButton.setTitle("AC", for: .normal)
        userIsTypingNumber = false
    }
 
}
