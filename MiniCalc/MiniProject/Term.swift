//
//  Term.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import Foundation

protocol Term {
    var value: Float? { get }
    var description: String { get }
}

struct TwoOperandsTerm {
    var op: Operator // the variable name 'operator' is forbidden by the compiler
    var lhs: Term
    var rhs: Term
}

extension TwoOperandsTerm: Term {
    var value: Float? {
        guard
            let lhs = lhs.value,
            let rhs = rhs.value
        else {
            return nil
        }
        return op.calculate(lhs: lhs, rhs: rhs)
    }
    var description: String {
        return "\(lhs.description) \(op.description) \(rhs.description)"
    }
}

extension Float: Term {
    var value: Float? {
        return self
    }
    var description: String {
        let string = "\(self)"
        if string.hasSuffix(".0") {
            return string.replacingOccurrences(of: ".0", with: "")
        } else {
            return string
        }
    }
}
