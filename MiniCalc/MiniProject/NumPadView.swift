//
//  NumPadView.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import UIKit

@IBDesignable
class NumPadView: UIView {

    var mainView: UIView!
    var delegate: CalculatorDelegate?
    
    var currentString = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(withIdentifier: "NumPadView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView(withIdentifier: "NumPadView")
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        
        if let _ = Float(text) {
            currentString += text
            delegate?.inputDidChange(to: currentString)
        } else if text == "," {
            currentString += "."
            delegate?.inputDidChange(to: currentString)
        } else if let op = Operator(rawValue: text) {
            currentString += " \(op.rawValue) "
            delegate?.inputDidChange(to: currentString)
        } else if text == "AC" {
            delegate?.resetCalculation()
            currentString = ""
        } else if text == "=" {
            delegate?.calculate()
        }
    }
}

extension NumPadView: XibView {
    
}
