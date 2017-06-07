//
//  ViewController.swift
//  ScientificCalculator
//
//  Created by Raleigh Green on 6/1/17.
//  Copyright © 2017 Raleigh Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    @IBOutlet var leftStackViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet var rightStackViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    
    var op:Int = 0 // this will be used to track which operator (op) was pressed
    var setZero:Bool = true
    var operand:Float = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setZero = true
        op = 0
        resultLabel.text = "0"
        
        
    }
    
    
    
    @IBAction func numericPressed(_ sender: UIButton) {
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
    }
    
    
    func calculateResult(oprtr: Int) -> Float {
        
        var returnValue: Float = Float(resultLabel.text!)!
        
        switch (oprtr) {
    
        case 1:
    
            returnValue = operand * returnValue
            break
            
        case 2:
    
            returnValue = operand / returnValue
            break
            
        case 3:
    
            returnValue = operand + returnValue
            break
            
        case 4:
            
            returnValue = operand - returnValue
            break
            
        default:
            break
    
        }
        
        return returnValue

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

