//
//  UserDetailsViewController.swift
//  MyUserRegistration
//
//  Created by Niraj Thanki on 4/2/17.
//  Copyright © 2017 Niraj Thanki. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
 
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var PhotoLibrary: UIButton!
    @IBOutlet weak var Camera: UIButton!
    @IBOutlet weak var ImageViewOrg: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var emailidlabel: UILabel!
    @IBOutlet weak var agelabel: UILabel!
    @IBOutlet weak var sexlabel: UILabel!
    @IBOutlet weak var weightlabel: UILabel!
    
    private var _name = String()
    
    var name : String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
    
    private var _email = String()
    
    var email : String {
        get {
            return _email
        } set {
            _email = newValue
        }
    }
    
    private var _age = String()
    
    var age : String {
        get {
            return _age
        } set {
            _age = newValue
        }
    }
    
    private var _sex = String()
    
    var sex : String {
        get {
            return _sex
        } set {
            _sex = newValue
        }
    }
    
    private var _weight = String()
    
    var weight : String {
        get {
            return _weight
        } set {
            _weight = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         namelabel.text = _name
        emailidlabel.text = _email
        agelabel.text = _age
        sexlabel.text = _sex
        weightlabel.text = _weight
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CameraAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera // for taking photo with camera
        picker.allowsEditing = false
        present(picker, animated:true) {
        }
    }
    @IBAction func PhotoLibraryAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary  // for selecting picture from photoLibrary
        picker.allowsEditing = false
        self.present(picker, animated:true) {
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImageViewOrg.image = picker
        } else {
            // Error Message
        }
        self.dismiss(animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
