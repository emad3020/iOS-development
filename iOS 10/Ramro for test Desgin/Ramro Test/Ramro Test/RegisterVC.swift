//
//  RegisterVC.swift
//  Ramro Test
//
//  Created by Emad on 8/24/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

   
    @IBOutlet weak var btn_back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let topItem = self.navigationController?.navigationBar.topItem
        topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
    }

    
    @IBAction func onBackPressed(sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
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
