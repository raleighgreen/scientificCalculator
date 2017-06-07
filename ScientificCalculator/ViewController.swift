//
//  ViewController.swift
//  ScientificCalculator
//
//  Created by Raleigh Green on 6/1/17.
//  Copyright © 2017 Raleigh Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftStackViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet var rightStackViewLeftConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        checkOrientation(orientation: UIDevice.current.orientation)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        checkOrientation(orientation: UIDevice.current.orientation)
    }
    
    func checkOrientation(orientation: UIDeviceOrientation) {
        
        if orientation.isPortrait {
            
            leftStackViewLeftConstraint.isActive = false
            rightStackViewLeftConstraint.isActive = true
            
        } else {
           
            leftStackViewLeftConstraint.isActive = true
            rightStackViewLeftConstraint.isActive = false
        }
        
    }
}

