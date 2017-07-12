//
//  ViewController.swift
//  pokedex
//
//  Created by sabarish sridhar on 01/06/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collection :UICollectionView!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    var musicPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
         parsePokemonCSV()
        searchBar.returnKeyType = UIReturnKeyType.done
        initAudio()
    }
    
    func initAudio()
    {
    let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string:path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        
        }
        catch let err as NSError{
        print(err.debugDescription)
        }
    }
    
    func parsePokemonCSV(){
    
        let path = Bundle.main.path(forResource: "pokemon", ofType : "csv")
        do{
            let csv = try CSV(contentsOfURL : path!)
            let rows = csv.rows
            
            for row in rows{
            
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name:name,pokedexId : pokeId)
                pokemon.append(poke)
                
            
            }
            
        
        
        }
        catch let err as NSError{
        print(err.debugDescription)
        
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let Cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PokeCell", for: indexPath) as? PokeCell {
            
            if inSearchMode{
            let poke = filteredPokemon[indexPath.row]
                Cell.configureCell(poke)
            }
            else{
            let poke = pokemon[indexPath.row]
            Cell.configureCell(poke)
            }
            return Cell
            
        }
        else{
            
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode{
        return filteredPokemon.count
        }
        return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:105,height:105)
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
                inSearchMode = false
        collection.reloadData()
            view.endEditing(true)

        }
        else{
        inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemon = pokemon.filter({$0.name.range(of:lower) != nil })
            collection.reloadData()
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        
        if musicPlayer.isPlaying{
        musicPlayer.pause()
            sender.alpha = 0.2
        }
        else{
        musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    

}

