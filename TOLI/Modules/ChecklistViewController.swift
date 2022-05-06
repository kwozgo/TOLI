//
//  ChecklistViewController.swift
//  TOLI
//
//  Created by Charlie Walton on 4/29/22.
//

import UIKit

final class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem]()
    
    // TODO: Something
    // FIXME: Fix some bugs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    @IBAction private func addItem() {
        let newRowIndex = self.items.count
        
        let item = ChecklistItem()
        item.text = "I'm a new row"
        self.items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        self.tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }
}

// MARK: - Table View Data Source

extension ChecklistViewController {
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        self.items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(
            withIdentifier: Default.checklistCellId,
            for: indexPath
        )
        
        let item = self.items[indexPath.row]
        
        self.configureText(for: cell, with: item)
        self.configureCheckmark(for: cell, with: item)
        
        return cell
    }
}

// MARK: - Table View Delegate

extension ChecklistViewController {
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        defer {
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        guard let cell = self.tableView.cellForRow(at: indexPath) else { return }
        let item = self.items[indexPath.row]
        item.checked.toggle()
        self.configureCheckmark(for: cell, with: item)
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        self.items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        self.tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}

private extension ChecklistViewController {
    
    enum Default {
        static let checklistCellId = "ChecklistItem"
    }
    
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        cell.accessoryType = item.checked ? .checkmark : .none
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}

extension ChecklistViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(
        _ controller: AddItemViewController
    ) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(
        _ controller: AddItemViewController, 
        didFinishAdding item: ChecklistItem
    ) {
        let newRowIndex = self.items.count
        self.items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        self.tableView.insertRows(at: indexPaths, with: .automatic)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
