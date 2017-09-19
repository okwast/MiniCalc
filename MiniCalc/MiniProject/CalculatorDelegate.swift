//
//  CalculatorDelegate.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import Foundation

protocol CalculatorDelegate {
    func inputDidChange(to string: String)
    func calculate()
    func resetCalculation()
}
