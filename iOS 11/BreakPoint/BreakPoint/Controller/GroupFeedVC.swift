//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Emad on 12/19/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var currentGroup: Group?
    var messagesArray = [Message]()
    func  initData(forGroup group : Group){
        self.currentGroup = group
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = currentGroup?.groupTitle
        DataService.instance.getEmails(forGroup: currentGroup!) { (returnedEmails) in
          self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessages(forGroup: self.currentGroup!, handler: { (returnedMessages) in
                self.messagesArray = returnedMessages
                self.tableView.reloadData()
                
                if self.messagesArray.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.messagesArray.count - 1 , section: 0), at: .none, animated: true)
                }
            })
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
        messageTextField.returnKeyType = UIReturnKeyType.done
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: currentGroup?.key, senderComplete: { (isCompleted) in
                if isCompleted {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                    
                }
            })
        }
    }
    
   
    
}

extension GroupFeedVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell") as? GroupFeedCell else { return UITableViewCell()}
        let messageItem = messagesArray[indexPath.row]
        DataService.instance.getUsername(forUID: messageItem.senderId) { (returnedUsername) in
         let profileImage = UIImage(named: "defaultProfileImage")!
        cell.configureCell(profileImage: profileImage, email: returnedUsername, content: messageItem.content)

        }
        return cell
    }
    
}
