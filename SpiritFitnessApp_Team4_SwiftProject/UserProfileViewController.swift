//
//  UserProfileViewController.swift
//  SpiritFitnessApp_Team4_SwiftProject
//
//  Created by Sumirna Philips on 4/4/17.
//  Copyright © 2017 19483. All rights reserved.
//

import UIKit
import Foundation

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* let registerationpage = (
            storyboard?.instantiateViewController(
                withIdentifier: "Register")
            )!
        registerationpage.modalTransitionStyle = .crossDissolve
        present(registerationpage, animated: true, completion: nil)*/
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        if(!SingletonClass.shared.isLoggedin){
        let loginPageController = (
            storyboard?.instantiateViewController(
                withIdentifier: "LoginContoller")
            )!
        loginPageController.modalTransitionStyle = .crossDissolve
        present(loginPageController, animated: true, completion: nil)
        }
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
