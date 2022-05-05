//
//  ChecklistViewController.swift
//  TOLI
//
//  Created by Charlie Walton on 4/29/22.
//

import UIKit

final class ChecklistViewController: UITableViewController {
    
    var row0item = ChecklistItem()
    var row1item = ChecklistItem()
    var row2item = ChecklistItem()
    var row3item = ChecklistItem()
    var row4item = ChecklistItem()
    
    let row0text = "Walk the dog"
    let row1text = "Brush my teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - Table View Data Source

extension ChecklistViewController {
    
    // TODO: Something
    // FIXME: Fix some bugs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = row0item.text
        } else if indexPath.row % 5 == 1 {
            label.text = row1item.text
        } else if indexPath.row % 5 == 2 {
            label.text = row2item.text
        } else if indexPath.row % 5 == 3 {
            label.text = row3item.text
        } else if indexPath.row % 5 == 4 {
            label.text = row4item.text
        }
        
        self.configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
}

// MARK: - Table View Delegate

extension ChecklistViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0item.checked.toggle()
            } else if indexPath.row == 1 {
                row1item.checked.toggle()
            } else if indexPath.row == 2 {
                row2item.checked.toggle()
            } else if indexPath.row == 3 {
                row3item.checked.toggle()
            } else if indexPath.row == 4 {
                row4item.checked.toggle()
            }
            configureCheckmark(for: cell, at: indexPath)
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0item.checked
        } else if indexPath.row == 1 {
            isChecked = row1item.checked
        } else if indexPath.row == 2 {
            isChecked = row2item.checked
        } else if indexPath.row == 3 {
            isChecked = row3item.checked
        } else if indexPath.row == 4 {
            isChecked = row4item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
