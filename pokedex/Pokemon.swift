//
//  Pokemon.swift
//  pokedex
//
//  Created by sabarish sridhar on 01/06/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import Foundation

class Pokemon{
    
    private var _name : String!
    private var _pokedexId : Int!
    var name :String{
    
    return _name
    }
    
    var pokedexId :Int{
    
        return _pokedexId
    }
    init(name: String, pokedexId:Int)
    {
    self.name = name
    self.pokedexId = pokedexId
    }
    
    
}
