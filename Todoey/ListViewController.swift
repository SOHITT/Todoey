//
//  ViewController.swift
//  Todoey
//
//  Created by apple on 24/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var fruitsName = ["apple","bnana","orange"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //DataSource method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsName.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PassData", for: indexPath)
        cell.textLabel?.text = fruitsName[indexPath.row]
        return cell
    }
    //delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(fruitsName[indexPath.row])
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
        
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonAction(_ sender: Any) {
        
        
        var textField = UITextField()
        
    let alert = UIAlertController(title: "ADD NEW TODOEY ITEM", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "ADD ITEM", style: .default) { (action) in
       // print(textField.text!)
        self.fruitsName.append(textField.text!)
        
        self.tableView.reloadData()
        
        
        
        }
        alert.addTextField { (alertTextField) in
        
        alertTextField.placeholder = "create new item"
            textField = alertTextField
        
        
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil )
    
    }
    
}


