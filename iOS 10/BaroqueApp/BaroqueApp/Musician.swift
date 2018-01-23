//
//  Musician.swift
//  BaroqueApp
//
//  Created by Emad on 6/20/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import Foundation

class Musician {
    //properties 
    
    private var name : String
    private var bio :  String
    private var country :  String
    private var year  : String
    
    init ( name : String , bio : String , country : String , year : String){
        self.bio = bio
        self.name = name
        self.country = country
        self.year = year
    }
    
    
    func getName() -> String {
        return name
    }
    
    func getBio () -> String {
        return bio
    }
    
    func getCountry() -> String {
        return country
    }
    
    func getYear() -> String {
        return year
    }
    
    
}
