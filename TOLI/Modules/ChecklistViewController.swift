//
//  ChecklistViewController.swift
//  TOLI
//
//  Created by Charlie Walton on 4/29/22.
//

import UIKit

final class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        self.items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        self.items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        self.items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        self.items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        self.items.append(item5)
    }
}

// MARK: - Table View Data Source

extension ChecklistViewController {
    
    // TODO: Something
    // FIXME: Fix some bugs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = self.items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        
        self.configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
}

// MARK: - Table View Delegate

extension ChecklistViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) {
            let item = self.items[indexPath.row]
            item.checked.toggle()
            
            configureCheckmark(for: cell, with: item)
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

private extension ChecklistViewController {
    
    private func configureCheckmark(for cell: UITableViewCell,with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
