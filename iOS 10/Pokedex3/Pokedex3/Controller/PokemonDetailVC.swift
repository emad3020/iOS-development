//
//  PokemonDetailVC.swift
//  Pokedex3
//
//  Created by Emad on 11/25/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
    }
    
    func updateUI(){
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        nameLbl.text = pokemon.name.capitalized
        pokedexLbl.text = "\(pokemon.pokedexId)"
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
