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
        let ehp = randomDouble(min: 400, max: 475)
        super.init(namecall: "Troll", maxhit_points: ehp, maxmana_points: 100, strg: randomDouble(min: 60, max: 70), spd: randomDouble(min: 4.0, max: 6.0), mag: randomDouble(min: 20.0, max: 40.0), dfense: randomDouble(min: 1, max: 5), turn_num: 1, turn_wait: 0, exp: 100, lev: 1, hit_points: ehp, id: 4)
        self.image = #imageLiteral(resourceName: "Troll")
    }
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func punch(user: Character) {
        let criticalroll = randomInt(min: 1, max: 100)
        var critical = 0.0
        if (criticalroll > 75) {
            critical = 2.5
        }
        else {
            critical = 1.0
        }
        let punchPow = ((50 - user.defense)/50)*(self.strength * 1.0 * randomDouble(min: 0.75, max: 1.25) * critical)
        user.hp = user.hp - punchPow
        print("Ouch! \(user.name) got punched and lost \(punchPow) HP!")
        self.turnwait -= 15
        appDelegate?.gameManager.attackPower = punchPow
        self.turn += 1
    }
    
    func slap(user: Character) {
        let accuracyroll = randomInt(min: 0, max: 100)
        var accuracy = 0.0
        if accuracyroll > 70 {
            accuracy = 0.0
        }
        else {
            accuracy = 1.0
        }
        var critical = 0.0
        if accuracy == 1.0 {
            let criticalroll = randomInt(min: 1,max: 100)
            if (criticalroll > 80){
                critical = 1.6
            }
            else{
                critical = 1.0
            }
        }
        let slapPow = ((50 - user.defense)/50)*(self.strength * randomDouble(min: 1.0, max: 1.9) * critical)
        user.hp = user.hp - slapPow
        print("SMACK! \(user.name) got slapped and lost \(slapPow) HP!")
        self.turnwait -= 12
        appDelegate?.gameManager.attackPower = slapPow
        self.turn += 1
    }
    
    override func get_attacks() -> [String] {
        return ["punch", "slap"]
    }
}
