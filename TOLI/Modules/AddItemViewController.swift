//
//  AddItemViewController.swift
//  TOLI
//
//  Created by Evolution on 5/5/22.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func addItemViewControllerDidCancel(
        _ controller: AddItemViewController
    )
    func addItemViewController(
        _ controller: AddItemViewController,
        didFinishAdding item: ChecklistItem
    )
}

class AddItemViewController: UITableViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textField.becomeFirstResponder()
    }
    
    @IBAction private func done() {
        print("Contents of the text field: \(self.textField.text!)")
        let item = ChecklistItem()
        item.text = self.textField.text!
        self.delegate?.addItemViewController(
            self,
            didFinishAdding: item
        )
    }
    
    @IBAction private func cancel() {
        self.delegate?.addItemViewControllerDidCancel(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Table View Delegates

extension AddItemViewController {
    
    override func tableView(
        _ tableView: UITableView,
        willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
        nil
    }
}

// MARK: - Text Field Delegates

extension AddItemViewController: UITextFieldDelegate {
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let oldText = self.textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(
            in: stringRange,
            with: string
        )
        
        self.doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.doneBarButton.isEnabled = false
        return true
    }
}

/// You can compare files with FileMerge - Xcode > Open Developer Tool > FileMerge
/// loose coupling - when object B is independent of object A

