//
//  Pokemon.swift
//  Pokedex3
//
//  Created by Emad on 11/24/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation

import Alamofire

class Pokemon {
    
    private var _name:String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type:String!
    private var _defense:String!
    private var _height:String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt : String!
    private var _pokemonURL : String!
    
    var name: String{
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    
    var weight: String {
        get {
            if _weight == nil {_weight = "" }
            return _weight
        }
        set {
            _weight = newValue
        }
    }
    
    var height: String {
        get {
            if _height == nil {_height = ""}
            return _height
        }
        set {
            _height = newValue
        }
        
    }
    var type: String {
        get {
            if _type == nil { _type = ""}
            return _type
        }
        set {
            _type = newValue
        }
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    
    func downloadPokemonDetails(completed: DownloadComplete){
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            let result = response.result.value
            if let dict = result as? Dictionary<String , AnyObject> {
                
                if let weight = dict["weight"] as? Int { self.weight = "\(weight)" }
                
                if let height = dict["height"] as? Int { self._height = "\(height)" }
                
                if let base_experience = dict["base_experience"] as? Int { self._attack = "\(base_experience)"
                    print(base_experience)
                }
                
            }
        }
        completed()
    }
    
    
}
