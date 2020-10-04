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
    var text: String? = "0"
    var logicInstance = ArithmeticLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.text = text
    }
    
    //MARK: Calculator Actions
    @IBAction func clear(_ sender: UIButton) {
        logicInstance.clear()
        text = "0"
        output?.text = "0"
    }
    
    @IBAction func equals(_ sender: UIButton) {
        text = logicInstance.completeOperation()
        if text != nil {
            output?.text = text
        }
    }
    
    //MARK: Operands
    @IBAction func zero(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("0")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func dot(_ sender: UIButton) {
        text = logicInstance.addDigitorDot(".")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func one(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("1")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func two(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("2")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func three(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("3")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func four(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("4")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func five(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("5")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func six(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("6")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func seven(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("7")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func eight(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("8")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func nine(_ sender: UIButton) {
        text = logicInstance.addDigitorDot("9")
        if text != nil {
            output?.text = text
        }
    }
    
    //MARK: Operators
    @IBAction func sinFunction(_ sender: UIButton) {
        text = logicInstance.doTrigOperator("sin")
        if text != nil {
            output?.text = text
        }
    }
    
    
    @IBAction func cosFunction(_ sender: UIButton) {
        text = logicInstance.doTrigOperator("cos")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func tanFunction(_ sender: UIButton) {
        text = logicInstance.doTrigOperator("tan")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func add(_ sender: UIButton) {
        text = logicInstance.doOperator("+")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        text = logicInstance.doOperator("-")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        text = logicInstance.doOperator("*")
        if text != nil {
            output?.text = text
        }
    }
    
    @IBAction func divide(_ sender: UIButton) {
        text = logicInstance.doOperator("/")
        if text != nil {
            output?.text = text
        }
    }
}

