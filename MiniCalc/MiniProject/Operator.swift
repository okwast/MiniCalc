//
//  Operator.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    var description: String {
        return rawValue
    }
    
    static private var operations: [Operator: (Float, Float) -> Float?] = [
        .add: { $0 + $1 },
        .subtract: { $0 - $1 },
        .multiply: { $0 * $1 },
        .divide: { $0 / $1 },
    ]
    
    func calculate(lhs: Float, rhs: Float) -> Float? {
        guard let operation = Operator.operations[self] else {
            return nil
        }
        return operation(lhs, rhs)
    }
}
