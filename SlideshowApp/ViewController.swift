//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 伊藤倫 on 2020/06/06.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nextimage: UIButton!
    @IBOutlet weak var backimage: UIButton!
    @IBOutlet weak var startstop: UIButton!
    
    var timer: Timer!
    
    var tapcount = 1
    
    var imageIndex = 0
    
    let images = [UIImage(named: "number0.jpeg"),UIImage(named: "number1.jpeg"),UIImage(named: "number2.jpeg")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageview.image = images[0]
    }
    
    @IBAction func nextimage(_ sender: Any) {
        if imageIndex == 2{
            imageIndex = 0
        }else{
            imageIndex += 1
        }
        imageview.image = images[imageIndex]
    }
    @IBAction func backimage(_ sender: Any) {
        if imageIndex == 0{
            imageIndex = 2
        }else{
            imageIndex -= 1
        }
        imageview.image = images[imageIndex]
    }
    @objc func onTimer(_ timer: Timer){
        if imageIndex == 2{
            imageIndex = 0
        }else{
            imageIndex += 1
        }
        imageview.image = images[imageIndex]
    }
    
    @IBAction func startstop(_ sender: Any) {
        tapcount += 1
        if tapcount % 2 == 0{
            self.timer=Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(onTimer(_:)),userInfo: nil, repeats: true)
            
            backimage.isEnabled = false
            nextimage.isEnabled = false
            
            startstop.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate()
            
            backimage.isEnabled = true
            nextimage.isEnabled = true
            
            startstop.setTitle("再生", for: .normal)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.image = images[imageIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    

}

