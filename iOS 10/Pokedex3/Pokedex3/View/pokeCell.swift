//
//  pokeCell.swift
//  Pokedex3
//
//  Created by Emad on 11/25/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class pokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        
    }
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        nameLbl.text = pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
