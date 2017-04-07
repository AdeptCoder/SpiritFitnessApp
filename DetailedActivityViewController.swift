//
//  DetailedActivityViewController.swift
//  SpiritFitnessApp_Team4_SwiftProject
//
//  Created by Sumirna Philips on 4/4/17.
//  Copyright © 2017 19483. All rights reserved.
//

import UIKit


class activityDetailsCustomTableViewCell: UITableViewCell{
    @IBOutlet weak var deviceSourceDetials: UILabel!
    @IBOutlet weak var durationDetails: UILabel!
    @IBOutlet weak var caloriesBurntDetails: UILabel!
    @IBOutlet weak var workOutSetsCount: UILabel!
}

class activityDetailsCustomForStepsTableViewCell: UITableViewCell{
    @IBOutlet weak var deviceSourceDetail: UILabel!
    @IBOutlet weak var noOfStepsDetails: UILabel!
    @IBOutlet weak var caloriesBurntByWalkDetail: UILabel!
    @IBOutlet weak var distanceWalkedDetails: UILabel!
}

class DetailedActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   @IBOutlet weak var dateTitleLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int{
            return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "firsttableCell", for: indexPath) as! activityDetailsCustomTableViewCell
            cell.workOutSetsCount?.text = "2"
            cell.caloriesBurntDetails?.text = "1000"
            cell.durationDetails?.text = "20"
            cell.deviceSourceDetials?.text = "Sumirna's iPhone"
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondtableCell", for: indexPath) as! activityDetailsCustomForStepsTableViewCell
            cell.noOfStepsDetails?.text = "2000"
            cell.distanceWalkedDetails?.text = "1 mil"
            cell.caloriesBurntByWalkDetail?.text = "50"
            cell.deviceSourceDetail?.text = "Sumirna's iPhone"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Work Out"}
        else{
            return "Walking"
        }
    }

    @IBAction func dismissModalViewButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year =  components.year!
        let month = components.month!
        let day = components.day!
        dateTitleLabel.text = "Date: \(month)-\(day)-\(year)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
