//
//  ViewController.swift
//  stopwatch_0402
//
//  Created by dit08 on 2019. 4. 2..
//  Copyright © 2019년 dit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    var c = 0
    var t = Timer()
    var t_running = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbl.text = String(c)
    }
    
    @IBAction func play(_ sender: Any) {
        if !t_running {
            t = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        t.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        t.invalidate()
        c = 0
        lbl.text = String(c)
    }
    
    @objc func updateTime() {
        c += 1
        lbl.text = String(c)
    }
}

