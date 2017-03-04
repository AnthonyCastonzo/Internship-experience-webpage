//
//  Knight.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class Knight: Character {
    init(level: Int) {
        super.init(namecall: "Knight", maxhit_points: 300, maxmana_points: 0, strg: 40, spd: 4, mag: 0, dfense: 5, turn_num: 1, turn_wait: 0, exp: 0, lev: level, hit_points: 300, id: 1)
        super.setLevel(value: level)
        self.image = #imageLiteral(resourceName: "Knight")
    }
    
    //SLASH
    override func attack1(target: Character) {
        let slashPow = ((50 - target.defense)/50) * (self.strength * randomDouble(min: 0.70, max: 1.10))
        target.hp = target.hp - slashPow
        print("SLASH!", "\(target.name) lost \(slashPow) HP")
        self.turnwait -= randomDouble(min: 15, max: 20)
        self.turn += 1
    }
    
    //RUSH
    override func attack2(target: Character) {
        let criticalroll = randomInt(min: 0, max: 100)
        var critical = 0.0
        if (criticalroll > 60) {
            critical = 2.0
        }
        else {
            critical = 1.0
        }
        let rushPow = ((50 - target.defense)/50) * (self.strength * randomDouble(min: 0.20, max: 0.90) * critical)
        target.hp = target.hp - rushPow
        print("WHOOSH!! \(target.name) lost \(rushPow) HP")
        self.turnwait -= randomDouble(min: 12, max: 15)
        self.turn += 1
    }
    
    //SHIELDTHROW
    override func attack3(target: Character) {
        let throwPow = ((50 - target.defense)/50) * (self.strength * randomDouble(min: 1.20, max: 1.80))
        target.hp = target.hp - throwPow
        print("THWACK!", "\(target.name) lost \(throwPow) HP")
        self.turn = 0
        self.turnwait -= 22
        pickerview?.reloadAllComponents()
    }
    
    override func get_attacks() -> [String]{
        return ["Slash", "Rush"]
    }
    override func get_charge() -> [String] {
        return ["Shieldthrow"]
    }
}
