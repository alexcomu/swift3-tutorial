//
//  ViewController.swift
//  13-pokedex
//
//  Created by Alex Comunian on 07/03/17.
//  Copyright © 2017 Hackademy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        parsePokemonCSV()
        initAudio()

    }
    
    func initAudio(){
        let path = Bundle.main.path(forResource: "pokemon_music", ofType: "mp3")!
        
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    func parsePokemonCSV(){
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do{
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
                
            }
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
        
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            cell.configureCell(pokemon[indexPath.row])
            return cell
        }else{
            return UICollectionViewCell()
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying{
            musicPlayer.pause()
            sender.alpha = 0.2
        }else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    
    
}

