//
//  ViewController.swift
//  ScientificCalculator
//
//  Created by Raleigh Green on 6/1/17.
//  Copyright © 2017 Raleigh Green. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //var audioPlayer = AVAudioPlayer()
    
    let soundFileNames = ["C2","C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2","C3","C#3","D3"]
    var audioPlayers = [AVAudioPlayer]()
    
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
        
        /*
         do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "C2", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        */
        
        for sound in soundFileNames {
            
            do {
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "mp3")!)
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
                
                audioPlayers.append(audioPlayer)
            }
            catch {
                audioPlayers.append(AVAudioPlayer())
            }
            
            
        }
        
        setZero = true
        op = 0
        resultLabel.text = "0"
        
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let audioPlayer = audioPlayers[sender.tag]
        
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            audioPlayer.play()
        }
        else {
            audioPlayer.play()
        }
        
        
    }
    
    /*
    @IBAction func playC(_ sender: Any) {
       
        audioPlayer.play()
    }
    
    @IBAction func playCsharp(_ sender: Any) {
        
        audioPlayer.play()
    }
    */
    
    
    
    
    
    @IBAction func numericPressed(_ sender: UIButton) {
        
        if setZero {
            resultLabel.text = "0"
            setZero = false
            
        }
        
        var result: Float = Float(resultLabel.text!)!
        result = result * 10 + Float(sender.tag)
        resultLabel.text =  "\(result)"
        
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        
        if op != 0 {
            operand = calculateResult(oprtr: op)
            resultLabel.text = "\(operand)"
            op = sender.tag
            setZero = true
        } else {
            let res: Float = Float(resultLabel.text!)!
            operand = res
            setZero = true
            op = sender.tag
        }
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        resultLabel.text = "0"
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        operand = calculateResult(oprtr: op)
        resultLabel.text = "\(operand)"
        op = 0
        setZero = true
        
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

