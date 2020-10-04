//
//  ViewController.swift
//  Calculator
//
//  Created by Sam Siner on 10/2/20.
//  Copyright © 2020 Digital Factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var output: UILabel!
    
//    //MARK: Variables
//    var firstOperand = ""
//    var secondOperand = ""
//    var isFirstOperand = true
//    var theOperator = ""
//    var total = 0.00
    
    var logicInstance = ArithmeticLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.text = "0"
    }
    
    //MARK: Actions
    @IBAction func clear(_ sender: UIButton) {
//        firstOperand = ""
//        secondOperand = ""
//        isFirstOperand = true
//        total = 0
        logicInstance.clear()
        output.text = "0"
    }
    
    @IBAction func equals(_ sender: UIButton) {
        let text = logicInstance.completeOperation()
        if text != nil {
            output.text = text
        }
    }
    
    //MARK: Operands
    @IBAction func zero(_ sender: UIButton) {
//        if (isFirstOperand && firstOperand == "") || (!isFirstOperand && secondOperand == ""){
//            return
//        }
//        addDigitOrDot(key: "0")
        let text = logicInstance.addDigitorDot("0")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func dot(_ sender: UIButton) {
//        if (isFirstOperand && firstOperand.contains(".")) || (!isFirstOperand && secondOperand.contains(".")){
//            return
//        }
//        addDigitOrDot(key: ".")
        let text = logicInstance.addDigitorDot(".")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func one(_ sender: UIButton) {
//        addDigitOrDot(key: "1")
        let text = logicInstance.addDigitorDot("1")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func two(_ sender: UIButton) {
//        addDigitOrDot(key: "2")
        let text = logicInstance.addDigitorDot("2")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func three(_ sender: UIButton) {
//        addDigitOrDot(key: "3")
        let text = logicInstance.addDigitorDot("3")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func four(_ sender: UIButton) {
//        addDigitOrDot(key: "4")
        let text = logicInstance.addDigitorDot("4")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func five(_ sender: UIButton) {
//        addDigitOrDot(key: "5")
        let text = logicInstance.addDigitorDot("5")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func six(_ sender: UIButton) {
//        addDigitOrDot(key: "6")
        let text = logicInstance.addDigitorDot("6")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func seven(_ sender: UIButton) {
//        addDigitOrDot(key: "7")
        let text = logicInstance.addDigitorDot("7")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func eight(_ sender: UIButton) {
//        addDigitOrDot(key: "8")
        let text = logicInstance.addDigitorDot("8")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func nine(_ sender: UIButton) {
//        addDigitOrDot(key: "9")
        let text = logicInstance.addDigitorDot("9")
        if text != nil {
            output.text = text
        }
    }
    
    //MARK: Operators
    
    @IBAction func sinFunction(_ sender: UIButton) {
//        doTrigOperator(key: "sin")
        let text = logicInstance.doTrigOperator("sin")
        if text != nil {
            output.text = text
        }
    }
    
    
    @IBAction func cosFunction(_ sender: UIButton) {
//        doTrigOperator(key: "cos")
        let text = logicInstance.doTrigOperator("cos")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func tanFunction(_ sender: UIButton) {
//        doTrigOperator(key: "tan")
        let text = logicInstance.doTrigOperator("tan")
        if text != nil {
            output.text = text
        }
    }
    
//    func doTrigOperator(key: String){
//        var result: Double
//        
//        if isFirstOperand {
//            if let firstNumber = Double(firstOperand){
//                switch key {
//                    case "sin":
//                        result = __sinpi(firstNumber / 180.0)
//                    case "cos":
//                        result = __cospi(firstNumber / 180.0)
//                    case "tan":
//                        result = __tanpi(firstNumber / 180.0)
//                    default:
//                        return
//                    }
//
//                firstOperand = result.description
//            } else {
//                return
//            }
//        } else {
//            if let secondNumber = Double(secondOperand){
//                switch key {
//                    case "sin":
//                        result = __sinpi(secondNumber / 180.0)
//                    case "cos":
//                        result = __cospi(secondNumber / 180.0)
//                    case "tan":
//                        result = __tanpi(secondNumber / 180.0)
//                    default:
//                        return
//                    }
//                               
//                secondOperand = result.description
//            } else {
//                return
//            }
//        }
//        
//        let formatter = NumberFormatter()
//        formatter.minimumFractionDigits = 0
//        formatter.maximumFractionDigits = 3
//        output.text = formatter.string(from: NSNumber(value: result))
//    }
    
    @IBAction func add(_ sender: UIButton) {
//        doOperator(key: "+")
        let text = logicInstance.doOperator("+")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func subtract(_ sender: UIButton) {
//        doOperator(key: "-")
        let text = logicInstance.doOperator("-")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func multiply(_ sender: UIButton) {
//        doOperator(key: "*")
        let text = logicInstance.doOperator("*")
        if text != nil {
            output.text = text
        }
    }
    
    @IBAction func divide(_ sender: UIButton) {
//        doOperator(key: "/")
        let text = logicInstance.doOperator("/")
        if text != nil {
            output.text = text
        }
    }
    
//    func doOperator(key: String){
//        if (firstOperand == "" && secondOperand == ""){
//            return
//        }
//        if isFirstOperand {
//            theOperator = key
//            isFirstOperand = false
//        } else {
//            completeOperation()
//            isFirstOperand = false
//            theOperator = key
//        }
//    }
//
//    func addDigitOrDot(key: String){
//        print(firstOperand)
//        print(secondOperand)
//        if isFirstOperand {
//            firstOperand.append(key)
//            output.text = firstOperand
//        } else {
//            secondOperand.append(key)
//            output.text = secondOperand
//        }
//    }
//
//    func completeOperation(){
//        if (isFirstOperand == true || theOperator == ""){
//            return
//        }
//
//        if (firstOperand != "" && secondOperand != ""){
//            if let firstNumber = Double(firstOperand), let secondNumber = Double(secondOperand){
//                switch theOperator{
//                case "+":
//                    total = firstNumber + secondNumber
//                case "-":
//                    total = firstNumber - secondNumber
//                case "*":
//                    total = firstNumber * secondNumber
//                case "/":
//                    total = firstNumber / secondNumber
//                default:
//                    return
//                }
//
//                print(total)
//                let formatter = NumberFormatter()
//                formatter.minimumFractionDigits = 0
//                formatter.maximumFractionDigits = 3
//                let stringTotal = formatter.string(from: NSNumber(value: total)) ?? ""
//
//                firstOperand = stringTotal
//                output.text = stringTotal
//                secondOperand = ""
//                theOperator = ""
//                isFirstOperand = true
//            }
//        }
//    }
    
//    func convertDouble(number: Double) -> String {
//        let formatter = NumberFormatter()
//        formatter.minimumFractionDigits = 0
//        formatter.maximumFractionDigits = 3
//        let stringTotal = formatter.string(from: NSNumber(value: number)) ?? ""
//        return string
//    }
}

