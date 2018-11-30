//
//  TableViewController.swift
//  Location_Logger
//
//  Created by raudel Valdes on 11/29/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit

var pets = ["dog","cat","rabbit"]
var petDesc = ["A dog is an animal with four legs", " A cat is an animal that likes fish", "A rabbit is an animal that likes to jump around"]
var myIndex = 0
class TableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = pets[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "locationInfo", sender: self)
    }
    
}
