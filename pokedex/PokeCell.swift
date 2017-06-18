//
//  PokeCell.swift
//  pokedex
//
//  Created by sabarish sridhar on 01/06/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg : UIImageView!
    @IBOutlet weak var nameLbl :UILabel!
    
    var pokemon :Pokemon!
    
    func configureCell(_ pokemon : Pokemon)
    {
    self.pokemon = pokemon
    nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named:"\(self.pokemon.pokedexId)")
    
    }
    
    required init? (coder aDecoder :NSCoder)
    {
        super.init(coder:aDecoder)
        layer.cornerRadius = 5.0
    }
}
