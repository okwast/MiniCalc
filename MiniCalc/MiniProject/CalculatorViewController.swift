//
//  CalculatorViewController.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var termLabelView: TermLabelView!
    @IBOutlet weak var numPadView: NumPadView!
    
    var currentTermString: String = ""
    var currentTerm: Term?
    
    var terms: [Term] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numPadView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "LastTerms",
            let termListTableViewController = segue.destination as? TermListTableViewController
        else {
            return
        }
        termListTableViewController.terms = terms
    }
    
    @IBAction func didSelectOldTerm(segue: UIStoryboardSegue) {
        guard
            let termListTableViewController = segue.source as? TermListTableViewController,
            let selectedTerm = termListTableViewController.selectedTerm
        else {
            return
        }
        currentTermString = selectedTerm.description
        currentTerm = selectedTerm
        termLabelView.termString = currentTermString
        numPadView.currentString = currentTermString
    }
}

extension CalculatorViewController: CalculatorDelegate {
    func inputDidChange(to string: String) {
        currentTermString = string
        currentTerm = TermParser.parseTerm(from: string)
        termLabelView.termString = string
    }
    func resetCalculation() {
        termLabelView.termString = currentTermString
        termLabelView.termString = ""
    }
    func calculate() {
        guard
            let currentTerm = currentTerm,
            let floatValue = currentTerm.value
        else {
            termLabelView.blink(inColor: .red)
            return
        }
        let newString = floatValue.description
        numPadView.currentString = newString
        termLabelView.termString = newString
        terms.insert(currentTerm, at: 0)
    }
}
