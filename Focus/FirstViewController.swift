//
//  FirstViewController.swift
//  Focus
//
//  Created by Shahan Nedadahandeh on 2019-12-13.
//  Copyright © 2019 Shahan Nedadahandeh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    private var startTime = Date();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.addTarget(self, action: #selector(self.startButtonClicked(_:)), for: .touchDown);
        stopButton.addTarget(self, action: #selector(self.stopButtonClicked(_:)), for: .touchDown);
    }
    
    @objc func startButtonClicked(_  sender:  UIButton){
        print("Start button clicked");
        print(startTime);
    }
    
    @objc func stopButtonClicked(_ sender: UIButton){
        print("Stop button clicked");
        let timeNow = Date();
        let timePassed = Int(timeNow.timeIntervalSince(startTime));
        
        print(timePassed);
    }
    
//    @objc func updateUI(){
//        print
//    }
    
    
    
}

