//
//  ViewController.swift
//  single present button
//
//  Created by Emad on 7/14/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func experiment(_ sender: Any) {
        let nextControl = UIImagePickerController()
        self.present(nextControl, animated: true, completion: nil)
    }

    @IBAction func showAlerts(_ sender: Any) {
        let alertDialog = UIAlertController()
        alertDialog.title = "This is an alert"
        alertDialog.message = "Hello wolrd I am stuck in alerts"
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){action in self.dismiss(animated: true, completion: nil )
        }
        
        
        alertDialog.addAction(okAction)
        
        self.present(alertDialog, animated: true, completion: nil)
    }
    
    @IBAction func OnSeguePerformed(_ sender: Any) {
//        var controller: SecondViewController
//        controller = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
//        self.present(controller, animated: true, completion: nil)
        
        performSegue(withIdentifier: "segueSecondView", sender: self)

    }



}

