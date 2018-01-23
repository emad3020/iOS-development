//
//  NotePost.swift
//  Demo Note
//
//  Created by Emad on 8/29/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation


class NotePost : NSObject{
    
    private var title:String!
    
    private var content:String!
    
    private var time:String!
    
    init(noteTitle:String , noteContent:String) {
        self.content = noteContent
        
        self.title = noteTitle
    }
    
    //Getters functions
    
    var noteTitle:String{
    
        return title
    }
    
    var noteContent:String{
        
        return content
    }
    
}
