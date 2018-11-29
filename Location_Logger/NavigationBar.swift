//
//  NavigationBar.swift
//  Location_Logger
//
//  Created by raudel Valdes on 11/29/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit

class NavigationBar: UIViewController {
    
    @IBOutlet weak var trailingViewConst: NSLayoutConstraint!
    @IBOutlet weak var leadingViewConst: NSLayoutConstraint!
    @IBOutlet weak var ubeView: UIView!
    
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
}
