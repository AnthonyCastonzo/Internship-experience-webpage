//
//  Golem.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 3/19/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class Golem: Character {
    init(level: Int){
        super.init(namecall: "Golem", maxhit_points: 400, maxmana_points: 0, strg: 20, spd: 3, mag: 5, dfense: 3, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 400, id: 4)
        super.setLevel(value: level)
        self.image = #imageLiteral(resourceName: "Golem")
    }
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //HARDEN
    override func attack1(target: Character) {
        let criticalroll = randomInt(min: 0, max: 100)
        var critical = 0.0
        if criticalroll > 92 {
            critical = 2.2
        }
        else {
            critical = 1.0
        }
        let slamPow = ((50 - target.defense)/50) * (self.strength * randomDouble(min: 0.55, max: 1.3) * critical)
        target.hp = target.hp - slamPow
        print("KABOOM! \(target.name) lost \(slamPow) HP")
        self.turnwait -= randomDouble(min: 15, max: 20)
        appDelegate?.gameManager.attackPower = slamPow
        self.turn += 1
    }
    
    //PUMMEL
    override func attack2(target: Character) {
        let accuracyroll = randomInt(min: 0, max: 100)
        var accuracy = 0.0
        if accuracyroll > 50 {
            accuracy = 0.0
        }
        else {
            accuracy = 1.0
        }
        let crushPow = ((50 - target.defense)/50) * (self.strength * 2.5 * accuracy)
        target.hp = target.hp - crushPow
        if crushPow == 0 {
            print("Whiff! You missed!")
            self.turnwait -= randomDouble(min: 18, max: 20)
            appDelegate?.gameManager.attackPower = crushPow
            self.turn += 1
        }
        else {
            print("Crush...\(target.name) lost \(crushPow) HP")
            self.turnwait -= randomDouble(min: 18, max: 20)
            appDelegate?.gameManager.attackPower = crushPow
            self.turn += 1
        }
    }
    
    //SACRIFICE
    override func attack3(target: Character) {
        let stompPow = self.strength * 2
        target.hp = target.hp - stompPow
        print("In the faaaaace! \(target.name) lost \(stompPow) HP")
        appDelegate?.gameManager.attackPower = stompPow
        self.turn = 0
        self.turnwait -= 22
        pickerview?.reloadAllComponents()
    }
    
    override func get_attacks() -> [String] {
        return ["Bodyslam", "Crush"]
    }
    override func get_charge() -> [String] {
        return ["Facestomp"]
    }
}
