//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Emad on 12/11/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var EmailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        EmailField.delegate = self
        passwordField.delegate = self
        
    }
  
    @IBAction func signInBtnPressed(_ sender: Any) {
        if EmailField.text != nil && passwordField.text != nil {
            
            AuthService.instance
                .loginUser(withEmail: EmailField.text!, andPassword: passwordField.text!, loginComplete: { (success, error) in
                    
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print(String(describing: error?.localizedDescription))
                    }
                    
                    AuthService.instance
                        .registerUser(withEmail: self.EmailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, error) in
        
                            if (success){
                                AuthService.instance.loginUser(withEmail: self.EmailField.text!, andPassword: self.EmailField.text!, loginComplete: { (sucess, nil) in
                                    self.dismiss(animated: true, completion: nil)
                                    print("User registered sucessfully....")
                                })
                            } else {
                                print(String(describing: error?.localizedDescription))
                            }
                        })
                })
        }
    }
    
    @IBAction func exitBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension LoginVC: UITextFieldDelegate {}
