//
//  ViewController.swift
//  stopwatch_0402
//
//  Created by dit08 on 2019. 4. 2..
//  Copyright © 2019년 dit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stopBtn: UIBarButtonItem!
    @IBOutlet weak var pauseBtn: UIBarButtonItem!
    @IBOutlet weak var playBtn: UIBarButtonItem!
    @IBOutlet weak var lbl: UILabel!
    var c = 0
    var t = Timer()
    var t_running = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbl.text = "00:00:00"
    }
    
    @IBAction func play(_ sender: Any) {
        if !t_running {
            t = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            changeButtonState(play: false, pause: true, stop: true)
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        t.invalidate()
        
        changeButtonState(play: true, pause: false, stop: true)
    }
    
    @IBAction func stop(_ sender: Any) {
        t.invalidate()
        c = 0
        lbl.text = "00:00:00"
        
        changeButtonState(play: true, pause: true, stop: false)
    }
    
    @objc func updateTime() {
        c += 1
        let min = c / 6000
        let sec = c / 100 - (min*60)
        let msec = c % 100
        let output = String(format: "%02d:%02d:%02d", min, sec, msec)
        lbl.text = output
    }
    
    func changeButtonState(play: Bool, pause: Bool, stop: Bool){
        playBtn.isEnabled = play
        stopBtn.isEnabled = stop
        pauseBtn.isEnabled = pause
    }
}

