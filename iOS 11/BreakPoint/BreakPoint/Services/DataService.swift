//
//  DataService.swift
//  BreakPoint
//
//  Created by Emad on 12/11/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    
    var REF_BASE : DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS : DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    
    func createDBUser(uid: String, userData: Dictionary<String,Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getUsername(forUID uid : String,handler: @escaping (_ username: String) ->()){
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot]
                else {return}
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func uploadPost(withMessage message : String , forUID uid: String , withGroupKey groupkey: String?, senderComplete: @escaping (_ status:Bool) ->()) {
        
        if groupkey != nil {
            REF_GROUPS.child(groupkey!).child("messages").childByAutoId()
                .updateChildValues(["content": message,"senderId": uid])
            senderComplete(true)
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message,"senderId":uid])
            senderComplete(true)
        }
    }
    
    func getAllFeedMessages(handler: @escaping(_ messages: [Message])-> ()){
        var messageArr = [Message]()
        
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let messageObj = Message(content: content, senderId: senderId)
                messageArr.append(messageObj)
            }
            handler(messageArr)
        }
    }
    
    func getAllMessages(forGroup: Group,handler: @escaping (_ messagesArray: [Message])->() ){
        var groupMessageArray = [Message]()
        REF_GROUPS.child(forGroup.key).child("messages").observeSingleEvent(of: .value) { (groupMessageSnapshot) in
            guard let messageSnapshot = groupMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for message in messageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senerID = message.childSnapshot(forPath: "senderId").value as! String
                let messageInfo = Message(content: content, senderId: senerID)
                groupMessageArray.append(messageInfo)
                
            }
            handler(groupMessageArray)
        }
        
    }
    
    func getEmail(forSearchQuery query : String,handler: @escaping (_ emailArray: [String])->()) {
        var emailArray = [String]()
        REF_USERS.observe(.value) { (snapshot) in
            guard let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) == true && email !=  Auth.auth().currentUser?.email  {
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func getIds(forUsernames usernames : [String] , handler: @escaping (_ uidArray: [String]) -> ()){
        var idArray = [String]()
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot]
            else    { return }
            
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if usernames.contains(email){
                    idArray.append(user.key)
                }
            }
            handler(idArray)
            
        }
    }
    
    func getEmails(forGroup :Group, handler : @escaping (_ emailArray:[String])->()) {
        var emailArray = [String]()
        REF_USERS.observeSingleEvent(of: .value) { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in snapshot {
                if forGroup.members.contains(user.key) {
                    let email = user.childSnapshot(forPath: "email").value as! String
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func createGroup(withTitle title: String, andDescription description : String ,forUserIds ids: [String], handler : @escaping (_ groupCreated: Bool) ->()) {
        let groupDic:Dictionary<String,Any> = ["title" : title, "description" : description, "members": ids ]
        REF_GROUPS.childByAutoId().updateChildValues(groupDic)
        
        handler(true)
    }
    
    
    func getAllGroups(handler: @escaping (_ groupsArray:[Group]) -> ()) {
        var groupsArray = [Group]()
        REF_GROUPS.observeSingleEvent(of: .value) { (groupSnapshot) in
            guard let groupSnapshot = groupSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for group in groupSnapshot {
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    let groupInfo = Group(title: title, description: description, key: group.key, members: memberArray, memberCount: memberArray.count)
                    groupsArray.append(groupInfo)
                }
            }
            handler(groupsArray)
        }
    }
    
}
