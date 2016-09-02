//
//  ViewController.swift
//  07-calculatorExample
//
//  Created by Alex Comunian on 02/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType:"wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do{
            // try to create the audio player
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            // catch error if fails -> avoid crash
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton){
        playSound()
    }
    
    func playSound(){
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
    }

}

