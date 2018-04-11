//
//  ViewController.swift
//  Digital_Watch
//
//  Created by D7703_27 on 2018. 4. 11..
//  Copyright © 2018년 D7703_27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerSwitch.isOn = false

//        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        //클로저(closure)의 사용
//        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
//            })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss a"
        lblTimer.text = formatter.string(from: date)
        //        lblTime.text = String(describing: date)
    }
    

    @IBAction func switchChanged(_ sender: Any) {
        if timerSwitch.isOn == true {
                        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (myTimer) in
                                self.updateTime()
                          })
                    }else{
                        myTimer.invalidate()
            
        }
    }
    
}

