//
//  Mage.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class Mage: Character {
    init(level: Int){
        super.init(namecall: "Mage", maxhit_points: 200, maxmana_points: 100, strg: 10, spd: 4, mag: 40, dfense: 2, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 200, id: 2)
        self.setLevel(value: level)
        self.image = #imageLiteral(resourceName: "Mage")
    }
    
    //FIRE
    override func attack1(target: Character) {
        let firePow = ((50 - target.defense)/50) * (self.magic * randomDouble(min: 0.70, max: 2.0))
        target.hp = target.hp - firePow
        print("BUUURRRNNN!", "\(target.name) lost \(firePow) HP")
        self.turnwait -= randomDouble(min: 15, max: 20)
        self.turn += 1
        
        
        
    }
    
    //STAFFWHACK
    override func attack2(target: Character){
        let criticalroll = randomInt(min: 1,max: 100)
        var critical = 0.0
        if (criticalroll > 85){
            critical = 8.0
        }
        else{
            critical = 1.0
        }
        let whackPow = ((50 - target.defense)/50) * (self.strength * 1.0 * critical)
        target.hp = target.hp - whackPow
        print("SMACK!", "\(target.name) lost \(whackPow) HP")
        self.turnwait -= randomDouble(min: 10, max: 15)
        self.turn += 1
    }
    
    //CARDTRICK
    override func attack3(target: Character) {
        let card_chance = randomInt(min: 1, max: 100)
        var cardpull = 0.0
        if card_chance < 50 {
            cardpull = randomDouble(min: 0, max: 4)
        }
        if card_chance >= 50 {
            cardpull = randomDouble(min: 13, max: 20)
        }
        let cardPow = (((50 - target.defense)/50) * (self.strength * cardpull))
        target.hp = target.hp - cardPow
        if card_chance < 50 {
            print("Unlucky draw. \(target.name) lost \(cardPow) HP")
        }
        if card_chance >= 50 {
            print("Your lucky card!! \(target.name) lost \(cardPow) HP")
        }
        self.turn = 0
        self.turnwait -= 22
        pickerview?.reloadAllComponents()
    }
    
    override func get_attacks() -> [String] {
        return ["Fire", "Staffwhack"]
    }
    override func get_charge() -> [String] {
        return ["Cardtrick"]
    }
}
