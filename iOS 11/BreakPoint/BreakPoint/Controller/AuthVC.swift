//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Emad on 12/11/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
    }
    
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInBtnPressed(_ sender: Any) {
    }
    
}
