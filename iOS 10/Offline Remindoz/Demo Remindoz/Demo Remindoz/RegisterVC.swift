//
//  RegisterVC.swift
//  Demo Remindoz
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import CoreData

class RegisterVC: UIViewController {

    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        
        let user = User(context: context)
        if let email = emailTextFeild.text {
             let index = email.characters.index(of: "@")
            user.user_email = email
            user.user_name = email.substring(to: index!)
        
        }
        
        if let password = passwordTextFeild.text, password == confirmPassTextField.text {
            user.user_password = password
        }
        ap.saveContext()
        
        performSegue(withIdentifier: "mainVC", sender: nil)
        
        
    }
}
