//
//  LoginViewController.swift
//  SpiritFitnessApp_Team4_SwiftProject
//
//  Created by Sumirna Philips on 4/4/17.
//  Copyright © 2017 19483. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func doneButton(_ sender: Any) {
        SingletonClass.shared.isLoggedin = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        let loginPageController = (
            storyboard?.instantiateViewController(
                withIdentifier: "Registration")
            )!
        loginPageController.modalTransitionStyle = .crossDissolve
        present(loginPageController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
