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
        print("view did load")
        
    }
    
    func textFieldDidEndEditing(_ titleTextField: UITextField) {
        titleString = titleTextField.text ?? "empty"
        titleTextField.text = titleString
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

//extension UINavigationController {
//
//    override open var shouldAutorotate: Bool {
//        get {
//            if let visibleVC = visibleViewController {
//                return visibleVC.shouldAutorotate
//            }
//            return super.shouldAutorotate
//        }
//    }
//
//    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        get {
//            if let visibleVC = visibleViewController {
//                return visibleVC.preferredInterfaceOrientationForPresentation
//            }
//            return super.preferredInterfaceOrientationForPresentation
//        }
//    }
//
//    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
//        get {
//            if let visibleVC = visibleViewController {
//                return visibleVC.supportedInterfaceOrientations
//            }
//            return super.supportedInterfaceOrientations
//        }
//    }
//
//}
