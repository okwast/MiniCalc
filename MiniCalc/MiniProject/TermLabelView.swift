//
//  CalculationLabelView.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import UIKit

@IBDesignable
class TermLabelView: UIView {
    
    var mainView: UIView!
    @IBOutlet weak var label: UILabel!
    
    var termString = "" {
        didSet {
            label.text = termString
        }
    }
    var term: Term?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(withIdentifier: "TermLabelView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView(withIdentifier: "TermLabelView")
    }
    
    func blink(inColor color: UIColor, andAnimationDuration duration: TimeInterval = 0.6) {
        UIView.animate(withDuration: duration / 2, animations: { [weak self] in
            self?.mainView.backgroundColor = color
        }, completion: { _ in
            UIView.animate(withDuration: duration / 2) { [weak self] in
                self?.mainView.backgroundColor = .white
            }
        })
    }
}

extension TermLabelView: XibView {
    
}
