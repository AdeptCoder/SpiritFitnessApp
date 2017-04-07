//
//  ViewController.swift
//  WorkOutSample
//
//  Created by Sumirna Philips on 3/22/17.
//  Copyright © 2017 19483. All rights reserved.
//

import UIKit
import AVFoundation
class WorkOutViewController: UIViewController {
    
    @IBOutlet weak var titleToolBar: UIToolbar!
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var workOutImage: UIImageView!
    @IBOutlet var startWorkOutButton: UIButton!
    @IBOutlet var frontView: UIView!
    @IBOutlet var nextWorkOutButton: UIButton!
    @IBOutlet var previousWorkOutButton: UIButton!
    @IBOutlet var workoutTitleLabel: UILabel!
    @IBOutlet weak var StartStopLabel: UILabel!
    
    var count = 0;
    var completedWorkOutCount = 0
    var wcounter = 0;
    var timer =  Timer();
    var workoutImages:[String] = ["workout1.png","workout2.png","workout3.png","workout4.png","workout5.png","workout6.png","workout7.png","workout8.png","workout9.png","workout10.png"]
    var workoutnames:[String] = ["High Knees","Squats","Plank", "Mountain Climber", "Sit Ups","Plank - R","Plank - L", "Lunge Run","Bicycle Crunch","Jumping Jack"];
    let systemSoundID: SystemSoundID = 1100
    let systemSoundID1: SystemSoundID = 1016
    //https://github.com/TUNER88/iOSSystemSoundsLibrary
    
    @IBAction func startWorkOut(_ sender: Any) {
        self.frontView.isHidden = true
    }
    
    @IBAction func nextWorkOutButtonAction(_ sender: Any) {
        ChangeWorkOut()
    }
    
    @IBAction func previousWorkOutButton(_ sender: Any) {
        wcounter = wcounter-2
        ChangeWorkOut()
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        if(StartStopLabel.text == "Start"){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            StartStopLabel.text = "Pause"
        }
        else if(StartStopLabel.text == "Pause"){
            timer.invalidate()
             StartStopLabel.text = "Resume"
           
        }
        else if(StartStopLabel.text == "Resume"){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            StartStopLabel.text = "Pause"
        }
    }
    
    @IBAction func EndWorkOutButtonAction(_ sender: Any) {
        EndWorkOutWithMessage(alertTile: "Alert", alertMessage: "You have ended the workout")
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        timer.invalidate()
        //startButton.setTitle("Start", for: .normal)
        StartStopLabel.text = "Start"
        count = 0
        timerLabel.text = "00"
    }
    
    func EndWorkOutWithMessage(alertTile:String, alertMessage:String){
        count=0
        wcounter=0
        timer.invalidate()
        StartStopLabel.text = "Start"
        timerLabel.text = "00"
        let alert = UIAlertController(title: alertTile, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in self.frontView.isHidden = false}))
        self.present(alert, animated: true, completion: nil)
    }

    func workOutComplete(){
        var message = ""
        var title = ""
        if(completedWorkOutCount == 0){
            title = "Alert"
        message = "You have not completed any 30sec activity in this  workout"}
        else{
            title = "Success"
        message = "You have completed \(completedWorkOutCount) 30sec activities in this  workout"}
        EndWorkOutWithMessage(alertTile: title, alertMessage:message )
    }
    
    func ChangeWorkOut(){
        wcounter = wcounter+1
        if(wcounter==10){
            workOutComplete()
        }
        else {
            previousWorkOutButton.isHidden = false
            nextWorkOutButton.isHidden = false
            if(wcounter==0) {
                previousWorkOutButton.isHidden = true
            }
            else if(wcounter==9){
                nextWorkOutButton.isHidden = true
            }
            self.workOutImage.image=UIImage(named: workoutImages[wcounter])
            workoutTitleLabel.text="Work Out - \(wcounter+1). \(workoutnames[wcounter])"
            timer.invalidate()
            //startButton.setTitle("Start", for: .normal)
             StartStopLabel.text = "Start"
            
            count = 0
            timerLabel.text = "00"
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        StartStopLabel.text = "Pause"
    }
    
    func counter() {
        count += 1
        if(count==31){
            completedWorkOutCount = completedWorkOutCount+1
            AudioServicesPlaySystemSound (systemSoundID1)
            ChangeWorkOut()
            startTimer()
        }
        else{
            AudioServicesPlaySystemSound (systemSoundID)
            if (count > 9) {
                timerLabel.text = "\(count)"
            }
            else {
                timerLabel.text = "0\(count)"
            }
        }
    }
    func cancelAction() {
        EndWorkOutWithMessage(alertTile: "Alert", alertMessage: "You have ended the workout")
        
    }
    
    func resetAction() {
        timer.invalidate()
        //startButton.setTitle("Start", for: .normal)
        StartStopLabel.text = "Start"
        
        count = 0
        timerLabel.text = "00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousWorkOutButton.isHidden = true;
        //let imageval = UIImage(named: "btnnew.png")?.withRenderingMode(.alwaysOriginal)
        
        let button1 = UIBarButtonItem(title: "End",
                                      style: UIBarButtonItemStyle.done,
                                      target: self,
                                      action: #selector(cancelAction))
        button1.tintColor = UIColor.cyan
        //button1.setBackgroundImage(imageval, for: .normal, barMetrics: .default)
        
        let button2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                      target: nil, action: nil)
        
        let button3 = UIBarButtonItem(title: "Reset",
                                      style: UIBarButtonItemStyle.done,
                                      target: self,
                                      action: #selector(resetAction))
        button3.tintColor = UIColor.cyan
        //button3.setBackgroundImage(imageval, for: .normal, barMetrics: .default)
        
        self.titleToolBar.items?.append(button1)
        self.titleToolBar.items?.append(button2)
        self.titleToolBar.items?.append(button3)
        
        //self.frontView.backgroundColor = UIColor(patternImage: UIImage(named: "bg1.png")!)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

