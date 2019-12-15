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
    
    private var millisPerCycle =  25 * 60_000; //number of milliseconds per cycle, by defualt 25 minutes
    private var startTime = Date().millisecondsSince1970;
    private var timeLeft = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.addTarget(self, action: #selector(self.startButtonClicked(_:)), for: .touchDown);
        stopButton.addTarget(self, action: #selector(self.stopButtonClicked(_:)), for: .touchDown);
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: true); // timer for updateing the ui
    }
    
    @objc func startButtonClicked(_  sender:  UIButton){
        print("Start button clicked");
        startTime = Date().millisecondsSince1970;
        timeLeft = Int(millisPerCycle);
        print(startTime);
    }
    
    @objc func stopButtonClicked(_ sender: UIButton){
        print("Stop button clicked");
    }
    
    @objc func updateUI(){
        
        print("HEYO");
    }
    func getTimeLeft(){
        
    }
    func getTimePassed() -> Int{//later on move this to a web server so it can not be cheated
        let timeNow = Date().millisecondsSince1970;
        let timePassed = Int(startTime - timeNow);
        return timePassed;
    }
    
    
}

extension Date {//all this is later going to be replaced by online server instead
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())//instead of using system time it should use some sort of web time inorder to avoid tampering.
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
