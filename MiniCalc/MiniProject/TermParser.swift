//
//  TermParser.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import Foundation

struct TermParser {
    static func parseTerm(from string: String) -> Term? {
        let tokens = string.components(separatedBy: " ")
        return parseTerm(from: tokens)
    }
    
    static func parseTerm(from tokens: [String]) -> Term? {
        if tokens.count == 1 {
            return Float(tokens[0])
        } else if let term = parseOperandTerm(from: tokens) {
            return term
        }
        return nil
    }
    
    // Not so pretty parsing, but to work with a grammar is too time consuming for one day^^
    private static func parseOperandTerm(from tokens: [String]) -> Term? {
        guard tokens.count >= 3 else {
            return nil
        }
        if let index = tokens.index(of: "+") {
            return parse(tokens: tokens, for: Operator(rawValue: "+")!, at: index)
        } else if let index = tokens.index(of: "-") {
            return parse(tokens: tokens, for: Operator(rawValue: "-")!, at: index)
        } else if let index = tokens.index(of: "*") {
            return parse(tokens: tokens, for: Operator(rawValue: "*")!, at: index)
        } else if let index = tokens.index(of: "/") {
            return parse(tokens: tokens, for: Operator(rawValue: "/")!, at: index)
        } else {
            return nil
        }
    }
    
    private static func parse(tokens: [String], for op: Operator, at index: Int) -> Term? {
        let lhsTokens = Array(tokens.prefix(upTo: index))
        let rhsTokens = Array(tokens.suffix(from: index + 1))
        guard
            let lhsTerm = parseTerm(from: lhsTokens),
            let rhsTerm = parseTerm(from: rhsTokens)
        else {
            return nil
        }
        return TwoOperandsTerm(op: op, lhs: lhsTerm, rhs: rhsTerm)
    }
}
