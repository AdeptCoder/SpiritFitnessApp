//
//  RegistrationController.swift
//  MyUserRegistration
//
//  Created by Niraj Thanki on 4/1/17.
//  Copyright © 2017 Niraj Thanki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

var userData: FIRDatabaseReference!

class RegistrationController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITextFieldDelegate {
    @IBOutlet var addresstxt: UITextField!
    @IBOutlet var nametxt: UITextField!
    @IBOutlet var emailtxt: UITextField!
    @IBOutlet var passwordtxt: UITextField!
    @IBOutlet var sextxt: UITextField!
    @IBOutlet var weighttxt: UITextField!
    @IBOutlet var agetxt: UITextField!
    @IBOutlet var citytxt: UITextField!
    @IBOutlet var statePickerBtn: UIButton!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet var countryPickerBtn: UIButton!
    @IBOutlet weak var countryPicker: UIPickerView!
 
    let states = ["Alaska","Arkansas","Alabama","California","Maine","New York"]
    let countries = ["INDIA","USA","CANADA","JAPAN","MEXICO","FRANCE","GERMANY"]
    var textFieldref:UITextField? = nil
    
    @IBAction func BacktoLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        if(FIRApp.defaultApp() == nil){
            FIRApp.configure()}
        userData = FIRDatabase.database().reference().child("users");
        citytxt.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RegistrationController.dismissKeyboard)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // for tapping outside the text field
    func dismissKeyboard() {
        textFieldref?.resignFirstResponder()
    }
    
    // for hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason){
        textFieldref=textField
    }
    
    func addUsers(){
        let key = userData.childByAutoId().key
        
        //-->//have made the address input as an empty string because of an error
        
        let users = [ "id" :key,
                      "Name:": nametxt.text! as String,
                      "Address:": addresstxt.text! as String,
                      "email:": emailtxt.text! as String,
                      "city:": citytxt.text! as String,
                      "age:": agetxt.text! as String,
                      "weight:": weighttxt.text! as String,
                      "password:": passwordtxt.text! as String]
        
        userData.child(key).setValue(users)
         //labelMessage.text = "User Added"
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal) //UIControlState.normal
        statePicker.isHidden = true
        countryPickerBtn.setTitle(countries[row], for: UIControlState.normal)
        countryPicker.isHidden = true
    }
    
    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
    }
    
    @IBAction func countryBtnPressed(_ sender: Any) {
        countryPicker.isHidden = false
    }
    
    @IBAction func SignUp(_ sender: Any) {
        addUsers()   // add the user details into Firebase Database
        let email = emailtxt.text
        let password = passwordtxt.text
        
        if self.emailtxt.text == "" || self.passwordtxt.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: email!, password: password!, completion: { (user: FIRUser?, error) in
                if error == nil {
                    let alertController = UIAlertController(title: "SUCCESS!", message: "You Have Successfully Registered.", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.dismiss(animated: true, completion: nil)
                    //self.labelMessage.text = "Registration Failed.. Please Try Again"
                }
                
            })
        }
        performSegue(withIdentifier: "UserDetailsViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination1 = segue.destination as? UserDetailsViewController {
            destination1.name = nametxt.text!
            destination1.age = agetxt.text!
            destination1.email = emailtxt.text!
            destination1.sex = sextxt.text!
            destination1.weight = weighttxt.text!
            
            
        }
    }
}

