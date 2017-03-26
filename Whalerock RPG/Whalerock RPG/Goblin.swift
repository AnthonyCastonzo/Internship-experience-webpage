//
//  Goblin.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 3/25/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class Goblin: Character {
    init(level: Int){
        let gobhp = randomDouble(min: 100, max: 120)
        super.init(namecall: "Goblin", maxhit_points: gobhp, maxmana_points: 100, strg: randomDouble(min: 20, max: 24), spd: 5, mag: randomDouble(min: 20.0, max: 30.0), dfense: randomDouble(min: 1, max: 3), turn_num: 1, turn_wait: 0, exp: 100, lev: 1, hit_points: gobhp, id: 5)
        self.image = #imageLiteral(resourceName: "Goblin")
    }
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func scratch(user: Character) {
        let accuracyroll = randomInt(min: 0, max: 100)
        var accuracy = 0.0
        if accuracyroll > 95 {
            accuracy = 0.0
        }
        else {
            accuracy = 1.0
        }
        var critical = 0.0
        if accuracy == 1.0 {
            let criticalroll = randomInt(min: 1,max: 100)
            if (criticalroll > 75){
                critical = 1.3
            }
            else{
                critical = 1.0
            }
        }
        let scratchPow = ((50 - user.defense)/50)*(self.strength * randomDouble(min: 0.9, max: 1.1) * critical)
        user.hp = user.hp - scratchPow
        print("Dang! \(user.name) got scratched and lost \(scratchPow) HP!")
        self.turnwait -= 12
        appDelegate?.gameManager.attackPower = scratchPow
        self.turn += 1
    }
    
    func claw(user: Character) {
        let accuracyroll = randomInt(min: 0, max: 100)
        var accuracy = 0.0
        if accuracyroll > 85 {
            accuracy = 0.0
        }
        else {
            accuracy = 1.0
        }
        var critical = 0.0
        if accuracy == 1.0 {
            let criticalroll = randomInt(min: 1,max: 100)
            if (criticalroll > 80){
                critical = 1.5
            }
            else{
                critical = 1.0
            }
        }
        let clawPow = ((50 - user.defense)/50)*(self.strength * randomDouble(min: 1.3, max: 1.5) * critical)
        user.hp = user.hp - clawPow
        print("SCRAPE! \(user.name) got clawed and lost \(clawPow) HP!")
        self.turnwait -= 14
        appDelegate?.gameManager.attackPower = clawPow
        self.turn += 1
    }
    
    override func get_attacks() -> [String] {
        return ["scratch", "claw"]
    }
}

