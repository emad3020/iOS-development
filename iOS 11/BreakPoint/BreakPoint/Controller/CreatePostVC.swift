//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Emad on 12/12/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit
import Firebase
class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    let userId = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        sendBtn.bindToKeyboard()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    @IBAction func sendBtnPressed(_ sender: Any) {
        if textField.text != nil &&
            textField.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance
                .uploadPost(withMessage: textField.text!, forUID: userId!, withGroupKey: nil, senderComplete: { (isComplete) in
                    
                    if isComplete {
                        self.sendBtn.isEnabled = true
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        //in case the uploading is not completed as expected
                        self.sendBtn.isEnabled = true
                        print("Can not upload the feed post there was an error!")
                    }
                })
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textField.text = ""
    }
    
}
