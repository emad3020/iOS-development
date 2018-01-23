//
//  ViewController.swift
//  Demo Note
//
//  Created by Emad on 8/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginVC: UIViewController {

    @IBOutlet weak var email_textField: UITextField!
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var password_textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func onLoginBtnPressed(_ sender: Any) {
        
        let email:String = email_textField.text!
        let password:String = password_textField.text!
        
        setUpUserLogin(user_email: email, user_password: password)
    }

    func setUpUserLogin(user_email:String,user_password:String) {
        print(user_email)
        print(user_password)
        Auth.auth().signIn(withEmail: user_email, password: user_password, completion: {(user,error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Cool")
                self.performSegue(withIdentifier: "mainSegue", sender: nil)
            }
        })
        
    }

}

