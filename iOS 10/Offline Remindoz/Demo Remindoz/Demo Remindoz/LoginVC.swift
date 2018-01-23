//
//  LoginVC.swift
//  Demo Remindoz
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import CoreData

class LoginVC: UIViewController {
    
    @IBOutlet weak var userPasswordField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    
    var controller:NSFetchedResultsController<User>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for user in getUsers() {
            print(user.user_email ?? "not fount")
        }

    }

   
    @IBAction func onLoginPressed(_ sender: UIButton) {
        
         let email = userEmailField.text
        let password = userPasswordField.text
        var isExist:Bool = false
        var currentUser:User!
        for user in getUsers() {
            currentUser = user
            if email == user.user_email && password == user.user_password {
                isExist = true
                break
            }
        }
        if isExist {
            performSegue(withIdentifier: "MainVC", sender: currentUser)
        } else {
            print("not in the array")
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MainVc" {
            if let destination = segue.destination as? MainVC {
                if let currentuser = sender as? User {
                    destination.currentUser = currentuser
                }
            }
        }
    }
    
    
    func getUsers() -> [User]{
        var user = [User]()
        let fetchRequest :NSFetchRequest<User> = User.fetchRequest()
        
        let userNameSort = NSSortDescriptor(key: "user_name", ascending: false)
        
        fetchRequest.sortDescriptors = [userNameSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        do {
            try controller.performFetch()
            user = controller.fetchedObjects!
            
        } catch {
            //handel the error
        }
        return user
    }
    
    
    
    
}
