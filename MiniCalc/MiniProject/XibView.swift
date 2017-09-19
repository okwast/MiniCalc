//
//  XibView.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import UIKit

protocol XibView: class {

    var mainView: UIView! { get set }

}

extension XibView where Self: UIView {
    func setupView(withIdentifier identifier: String) {
        mainView = loadViewFromNib(withIdentifier: identifier)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mainView)
        
        self.addConstraints([
            NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: mainView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: mainView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: mainView, attribute: .bottom, multiplier: 1, constant: 0),
        ])
    }
    
    func loadViewFromNib(withIdentifier identifier: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: identifier, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
