//
//  ViewController.swift
//  pokedex
//
//  Created by sabarish sridhar on 01/06/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection :UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
            
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let Cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PokeCell", for: indexPath) as? PokeCell {
            
            let pokemon = Pokemon(name :"Pokemon", pokedexId : indexPath.row)
            Cell.configureCell(pokemon:pokemon)
            
            return Cell
            
        }
        else{
            
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:105,height:105)
        
    }
    

}

