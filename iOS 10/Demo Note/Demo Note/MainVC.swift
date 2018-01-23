//
//  MainVC.swift
//  Demo Note
//
//  Created by Emad on 8/29/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import Firebase

class MainVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var noteTableView: UITableView!
    var notePosts: [DataSnapshot]! = []
    var ref :DatabaseReference!
    var userID:String!
    fileprivate var _refHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let p1 = NotePost(noteTitle: "Hello boys", noteContent: "Offices parties lasting outward nothing age few resolve. Impression to discretion understood to we interested he excellence. Him remarkably use projection collecting. Going about eat forty world has round miles. Attention affection at my preferred offending shameless me if agreeable. Life lain held calm and true neat she. Much feet each so went no from. Truth began maids linen an mr to after.")
        noteTableView.delegate = self
        noteTableView.dataSource = self
//        notePosts.append(p1)
     configureDatabase()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteCell{
            
            let notepost : DataSnapshot! = notePosts[indexPath.row]
            let Note = notepost.value as! [String: String] 
             let name = Note["title"] ?? "[title]"
            let text = Note["content"] ?? "[content]"
            cell.updateUI(title: name, content: text)
            
            return cell
        } else {
            return UITableViewCell()
        }
        }
    
    //recieve data from firebase database as snapshot
    func configureDatabase() {
        let userID = Auth.auth().currentUser?.uid
        ref = Database.database().reference()
        _refHandle = ref.child(userID!).observe(.childAdded){
            (snapshot : DataSnapshot) in
            self.notePosts.append(snapshot)
            self.noteTableView.insertRows(at: [IndexPath(row : self.notePosts.count - 1, section : 0 )], with: .automatic)
            
            
        }
    }

    
}
