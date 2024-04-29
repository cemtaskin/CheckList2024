//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 25.03.2024.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var txtNewItem : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtNewItem.becomeFirstResponder()
    }
    
    @IBAction func cancel  (){
        dismiss(animated: true)
    }
    
    @IBAction func done (){
        if let newItemText = txtNewItem.text {
            print (newItemText)
        }
        
        
        
        dismiss(animated: true)
    }


}
