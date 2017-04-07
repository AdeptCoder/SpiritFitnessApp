//
//  HistoryViewController.swift
//  SpiritFitnessApp_Team4_SwiftProject
//
//  Created by Sumirna Philips on 4/2/17.
//  Copyright © 2017 19483. All rights reserved.
//

import UIKit
import Foundation

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
var items: [String] = ["3-Mar | 2 workouts, 333 steps", "4-Mar | 3 workouts, 122 steps", "5-Mar | 2 workouts, 2000 steps"]
var sectiontitle:[String] = ["March 2017", "February 2017"]
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if(tableView.tag == 120){
        return 1}
    else{
        return items.count}
}
func numberOfSections(in tableView: UITableView) -> Int{
    if(tableView.tag == 120){
        return 1}
    else{
        return sectiontitle.count;}
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if(tableView.tag == 120){
        let cell = tableView.dequeueReusableCell(withIdentifier: "firsttableCell", for: indexPath) as! CustomTableViewCellForToday
        cell.workOutLabel?.text = "2"
        cell.stepsCountLabel?.text = "1000"
        return cell
    }
    else {
       let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
         cell.textLabel?.text = "   " + self.items[indexPath.row]
         return cell
    }
}
  
func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath){
    let detailedViewController = (
        storyboard?.instantiateViewController(
            withIdentifier: "DetailedActivityModal")
        )!
    detailedViewController.modalTransitionStyle = .crossDissolve
    present(detailedViewController, animated: true, completion: nil)
}

func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if(tableView.tag == 120){
        return "Today"}
    else{
        return self.sectiontitle[section]}
}
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}
