//
//  FeedVC.swift
//  BreakPoint
//
//  Created by Emad on 12/11/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_FEED.observe(.value) { (snapshot) in
            DataService.instance.getAllFeedMessages { (messages) in
                self.messageArray = messages.reversed()
                self.tableView.reloadData()
            }
        }
       
    }

}

extension FeedVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell{
        let message = messageArray[indexPath.row]
            DataService.instance.getUsername(forUID: message.senderId, handler: { (returnedUsername) in
                cell.configureCell(email: returnedUsername, content: message.content)
            })
        return cell
        } else {return UITableViewCell()}
    }
}
