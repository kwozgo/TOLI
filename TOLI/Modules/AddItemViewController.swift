//
//  AddItemViewController.swift
//  TOLI
//
//  Created by Evolution on 5/5/22.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var doneBarButton: UIBarButtonItem!
    
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
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func cancel() {
        self.navigationController?.popViewController(animated: true)
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
