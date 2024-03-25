//
//  ChecklistTableViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 18.03.2024.
//

import UIKit

class ChecklistTableViewController: UITableViewController {
    var row0item : ChecklistItem
    var row1item : ChecklistItem
    var row2item : ChecklistItem
    var row3item : ChecklistItem
    var row4item : ChecklistItem
    
    
    required init?(coder: NSCoder) {
        row0item = ChecklistItem()
        row0item.text="Walk the dog"
        row0item.checked=false
        
        row1item = ChecklistItem()
        row1item.text="Brush my teeth"
        row1item.checked=true
        
        row2item = ChecklistItem()
        row2item.text="Learn iOS development"
        row2item.checked=true
        
        row3item = ChecklistItem()
        row3item.text="Soccer practice"
        row3item.checked=false
        
        row4item = ChecklistItem()
        row4item.text="Eat ice cream"
        row4item.checked=true
        
        super.init(coder: coder)
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows in section")
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Cell for row at : \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        if(indexPath.row%5==0){
            label.text=row0item.text
        }else if(indexPath.row%5==1){
            label.text=row1item.text
        }else if(indexPath.row%5==2){
            label.text=row2item.text
        }else if(indexPath.row%5==3){
            label.text=row3item.text
        }else if(indexPath.row%5==4){
            label.text=row4item.text
        }
        
        return cell
    }
    
    func configureCheckMark (for cell : UITableViewCell,at indexPath : IndexPath){
        if (indexPath.row==0){
            row0item.checked = !row0item.checked
            
            if (row0item.checked){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
        if (indexPath.row==1){
            row1item.checked = !row1item.checked
            
            if (row1item.checked){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
        if (indexPath.row==2){
            row2item.checked = !row2item.checked
            
            if (row2item.checked){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
        if (indexPath.row==3){
            row3item.checked = !row3item.checked
            
            if (row3item.checked){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
        if (indexPath.row==4){
            row4item.checked = !row4item.checked
            
            if (row4item.checked){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let cell = tableView.cellForRow(at: indexPath){
            configureCheckMark(for: cell, at: indexPath)
        }
       
        tableView.deselectRow(at: indexPath, animated: true)

    }
        

}
