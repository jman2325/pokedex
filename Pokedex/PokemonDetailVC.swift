//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Jacob Bailey on 6/28/17.
//  Copyright © 2017 Jacob Bailey. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLable.text = pokemon.name.capitalized
        
        let image = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = image
        currentEvoImage.image = image
        pokedexLabel.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails {
            print("did arrive here?")
            // Whatever we write will only be called when network call is complete.
            self.updateUI()
        }
    }
    
    
    func updateUI() {
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
            
        } else {
        
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
        
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}















