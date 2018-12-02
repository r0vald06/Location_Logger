//
//  NavigationBar.swift
//  Location_Logger
//
//  Created by raudel Valdes on 11/29/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit

class NavigationBar: UIViewController {
    
    var itemStore: ItemStore!
    
    @IBOutlet weak var trailingViewConst: NSLayoutConstraint!
    @IBOutlet weak var leadingViewConst: NSLayoutConstraint!
    @IBOutlet weak var ubeView: UIView!

    @IBAction func locationButton(_ sender: Any) {
        performSegue(withIdentifier: "locationTable", sender: self)
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let nextTableViewController = segue.destination as! TableViewController
        nextTableViewController.itemStore = itemStore
    }
    
    var navButtonVisible = false;
    
    @IBAction func navButton(_ sender: Any) {
        
        if !navButtonVisible {
            leadingViewConst.constant = 200;
            //trailingViewConst.constant = -150;
            
            navButtonVisible = true;
        } else {
            leadingViewConst.constant = 0;
            trailingViewConst.constant = 0;
            
            navButtonVisible = false;
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
}

extension UINavigationController {

    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }

    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }

    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
}


