//
//  ChecklistTableViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 18.03.2024.
//

import UIKit

class ChecklistTableViewController: UITableViewController {
    
    var items : [ChecklistItem]
    
    required init?(coder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text="Walk the dog"
        row0item.checked=false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text="Brush my teeth"
        row1item.checked=true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text="Learn iOS development"
        row2item.checked=true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text="Soccer practice"
        row3item.checked=false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text="Eat ice cream"
        row4item.checked=true
        items.append(row4item)
        
        super.init(coder: coder)
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows in section")
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Cell for row at : \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        let item = items[indexPath.row%5]
        label.text = item.text
        configureCheckMark(for: cell, at: indexPath)
        return cell
    }
    
    func configureCheckMark (for cell : UITableViewCell,at indexPath : IndexPath){
        
        let item = items[indexPath.row%5]
        if item.checked{
            cell.accessoryType = .checkmark
        }else
        {
            cell.accessoryType = .none
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.checked = !item.checked
            configureCheckMark(for: cell, at: indexPath)
        }
       
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}
