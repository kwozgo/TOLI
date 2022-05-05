//
//  AddItemViewController.swift
//  TOLI
//
//  Created by Evolution on 5/5/22.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func done() {
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
