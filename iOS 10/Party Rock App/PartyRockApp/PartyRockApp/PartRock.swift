//
//  PartRock.swift
//  PartyRockApp
//
//  Created by Emad on 8/22/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation


class PartRock {
    
    private var _imageURL : String!
    private var _videoURL: String!
    private var _videoTitle:String!
    
    init(imageURL:String,vidoURL:String,videoTitle:String) {
        self._imageURL = imageURL
        self._videoURL =  vidoURL
        self._videoTitle = videoTitle
    }
    
    
    //Getters functions for the varriables 
    
    var imageURL:String {
        return _imageURL
    }
    
    var videoURL:String {
        return _videoURL
    }
    
    var videoTitle:String {
        return _videoTitle
    } 
    
    
}
