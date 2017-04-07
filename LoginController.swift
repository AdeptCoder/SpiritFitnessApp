//
//  LoginController.swift
//  MyUserRegistration
//
//  Created by Niraj Thanki on 4/2/17.
//  Copyright © 2017 Niraj Thanki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
 
    @IBAction func RegisterButton(_ sender: Any) {
        let loginPageController = (
            storyboard?.instantiateViewController(
                withIdentifier: "Registration")
            )!
        loginPageController.modalTransitionStyle = .crossDissolve
        present(loginPageController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(FIRApp.defaultApp() == nil){
        FIRApp.configure()
        }
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RegistrationController.dismissKeyboard)))
        passwordtxt.delegate = self
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // for tapping outside the text field
    func dismissKeyboard() {
        passwordtxt.resignFirstResponder()
    }
    
    // for hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginAction(_ sender: Any) {
        SingletonClass.shared.isLoggedin = true
        self.dismiss(animated: true, completion: nil)
        if self.emailtxt.text == "" || self.passwordtxt.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.emailtxt.text!, password: self.passwordtxt.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    //Go to the HomeViewController if the login is sucessful
                    let alertController = UIAlertController(title: "SUCCESS!", message: "You Have Successfully Log in.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    //let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    //self.present(vc!, animated: true, completion: nil)
                    self.dismiss(animated: true, completion: nil)
                } else {
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
