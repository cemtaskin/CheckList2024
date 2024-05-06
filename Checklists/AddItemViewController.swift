//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 25.03.2024.
//

import UIKit

class AddItemViewController: UITableViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textField : UITextField?
    
    weak var delegate : AddItemViewControllerDelegate?
    
    @IBOutlet weak var doneBarButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        textField?.becomeFirstResponder()
    }

        
    @IBAction func cancel()
    {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done()
    {
        let item = ChecklistItem()
        item.text = textField!.text!
        item.checked=false
        delegate?.addItemViewController(self, didFinishAdding: item)
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        if (newText.length>0){
            doneBarButton.isEnabled=true
        }else{
            doneBarButton.isEnabled=false
        }
        
        return true
        
    }

    
}

protocol AddItemViewControllerDelegate : class{
    func addItemViewControllerDidCancel(_ controller : AddItemViewController)
    func addItemViewController (_ controller : AddItemViewController, didFinishAdding item : ChecklistItem)
}
