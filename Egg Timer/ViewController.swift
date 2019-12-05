//
//  ViewController.swift
//  Egg Timer
//
//  Created by Md Sifat on 12/5/19.
//  Copyright © 2019 Md Sifat. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation


class ViewController: UIViewController {
    
    var counter = 0
    var timer = Timer()
    var time = 16
    var audio: AVAudioPlayer!
    var url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")

    @IBOutlet weak var Showlebel: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func StartBtn(_ sender: UIButton) {
        timer.invalidate()
        
        counter = 0
        ProgressView.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeLimit), userInfo: nil, repeats: true)

    }
    
    @objc func timeLimit()
    {
        if(counter < time){
            counter += 1
            //print(counter)
            ProgressView.progress = Float(counter) / Float(time)
            
            if counter == 3 {
                ImageView.image = UIImage(named: "1")
            }
            if counter == 6 {
                ImageView.image = UIImage(named: "2")
            }
            if counter == 8 {
                ImageView.image = UIImage(named: "3")
            }
            if counter == 11 {
                ImageView.image = UIImage(named: "4")
            }
            if counter == 13 {
                ImageView.image = UIImage(named: "5")
            }
            if counter == 15{
                ImageView.image = UIImage(named: "53")
            }
        }else{
            audio = try! AVAudioPlayer(contentsOf: self.url!)
            audio.play()
            timer.invalidate()
            counter = 0
        }


    }

}
