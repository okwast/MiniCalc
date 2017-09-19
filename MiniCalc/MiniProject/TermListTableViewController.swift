//
//  TermListTableViewController.swift
//  MiniProject
//
//  Created by Oliver Kwast on 19.09.17.
//  Copyright © 2017 Oliver Kwast. All rights reserved.
//

import UIKit

class TermListTableViewController: UITableViewController {
    
    var terms: [Term]? {
        didSet {
            tableView?.reloadData()
        }
    }
    var selectedTerm: Term?

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let terms = terms else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermCell", for: indexPath)

        let term = terms[indexPath.row]
        if let value = term.value {
            cell.textLabel?.text = value.description
        } else {
            cell.textLabel?.text = "Kein Ergebnis"
        }
        cell.detailTextLabel?.text = term.description

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let terms = terms,
            let index = tableView.indexPathForSelectedRow?.row
        else {
            return
        }
        selectedTerm = terms[index]
    }

}
