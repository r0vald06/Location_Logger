//
//  LocationInfoViewController.swift
//  Location_Logger
//
//  Created by raudel Valdes on 11/29/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit
import MapKit

class LocationInfoViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var locationMapView: MKMapView!
    var titleString=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib
        self.titleTextField.delegate = self
        self.dateTextField.delegate = self
        self.addressTextField.delegate = self
        self.descriptionTextView.delegate = self
        
        if let x = UserDefaults.standard.object(forKey: "title") as? String {
            titleTextField.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "date") as? String {
            dateTextField.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "address") as? String {
            addressTextField.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "description") as? String {
            descriptionTextView.text = x
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "title") as? String {
            titleTextField.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "date") as? String {
            dateTextField.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "address") as? String {
            addressTextField.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "description") as? String {
            descriptionTextView.text = x
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.set(titleTextField.text, forKey: "title")
        UserDefaults.standard.set(addressTextField.text, forKey: "address")
        UserDefaults.standard.set(dateTextField.text, forKey: "date")
        
    }
    
    func textViewDidEndEditing(_ descriptionTextView: UITextView) {
        UserDefaults.standard.set(descriptionTextView.text, forKey: "description")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
}

