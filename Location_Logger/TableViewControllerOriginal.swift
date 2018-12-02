////
////  TableViewController.swift
////  Location_Logger
////
////  Created by raudel Valdes on 11/29/18.
////  Copyright © 2018 Raudel Valdes. All rights reserved.
////
//
//import UIKit
//
//class TableViewControllerOriginal: UITableViewController {
//    
//    var itemStore: ItemStore!
//    
//    @IBAction func toggleEditingMode(_ sender: UIButton) {
//        // If you are currently in editing mode...
//        if isEditing {
//            // Change text of button to inform user of state
//            sender.setTitle("Edit", for: .normal)
//            // Turn off editing mode
//            setEditing(false, animated: true)
//        } else {
//            // Change text of button to inform user of state
//            sender.setTitle("Done", for: .normal)
//            // Enter editing mode
//            setEditing(true, animated: true)
//        }
//    }
//    
//    
//    @IBAction func addNewItem(_ sender: UIButton) {
//        // Create a new item and add it to the store
//        let newItem = itemStore.createItem()
//        // Figure out where that item is in the array
//        if let index = itemStore.allItems.index(of: newItem) {
//            let indexPath = IndexPath(row: index, section: 0)
//            // Insert this new row into the table
//            tableView.insertRows(at: [indexPath], with: .automatic)
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pets.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        cell.textLabel?.text = pets[indexPath.row]
//        
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        myIndex = indexPath.row
//        performSegue(withIdentifier: "locationInfo", sender: self)
//    }
//    
//    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "Remove"
//    }
//    
//}
