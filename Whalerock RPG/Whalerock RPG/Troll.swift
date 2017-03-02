//
//  Troll.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class Enemy: Character {
    init(level: Int){
        let ehp = randomDouble(min: 250, max: 400)
        super.init(namecall: "Troll", maxhit_points: ehp, maxmana_points: 100, strg: randomDouble(min: 50, max: 80), spd: randomDouble(min: 3.0, max: 5.0), mag: randomDouble(min: 10.0, max: 40.0), dfense: randomDouble(min: 1, max: 5), turn_num: 1, turn_wait: 0, exp: 100, lev: 1, hit_points: ehp, id: 4)
        self.image = #imageLiteral(resourceName: "Troll")
    }
    
    func punch(user: Character) {
        let criticalroll = randomInt(min: 1, max: 100)
        var critical = 0.0
        if (criticalroll > 80) {
            critical = 3.0
        }
        else {
            critical = 1.0
        }
        let punchPow = ((50 - user.defense)/50)*(self.strength * 1.0 * randomDouble(min: 0.6, max: 1.0) * critical)
        user.hp = user.hp - punchPow
        print("Ouch! \(user.name) got punched and lost \(punchPow) HP!")
        self.turnwait -= randomDouble(min: 12, max: 18)
        self.turn += 1
    }
    
    func slap(user: Character) {
        let criticalroll = randomInt(min: 1, max: 100)
        var critical = 0.0
        if (criticalroll > 80) {
            critical = 1.8
        }
        else {
            critical = 1.0
        }
        let slapPow = ((50 - user.defense)/50)*(self.strength * randomDouble(min: 0.3, max: 1.8) * critical)
        user.hp = user.hp - slapPow
        print("SMACK! \(user.name) got slapped and lost \(slapPow) HP!")
        self.turnwait -= randomDouble(min: 11, max: 16)
        self.turn += 1
    }
    
    override func get_attacks() -> [String] {
        return ["punch", "slap"]
    }
}
