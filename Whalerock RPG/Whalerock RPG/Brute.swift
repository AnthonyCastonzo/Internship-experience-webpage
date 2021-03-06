//
//  Brute.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class Brute: Character {
    init(level: Int){
        super.init(namecall: "Brute", maxhit_points: 250, maxmana_points: 15, strg: 50, spd: 3, mag: 10, dfense: 5, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 250, id: 3)
        super.setLevel(value: level)
        self.image = #imageLiteral(resourceName: "Brute")
    }
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //BODYSLAM
    override func attack1(target: Character) {
        var critical = 0.0
        let criticalroll = randomInt(min: 1,max: 100)
        if (criticalroll > 91){
            critical = 2.15
        }
        else{
            critical = 1.0
        }
        let slamPow = ((50 - target.defense)/50) * (self.strength * randomDouble(min: 0.9, max: 1.1) * critical)
        target.hp = target.hp - slamPow
        print("KABOOM! \(target.name) lost \(slamPow) HP")
        self.turnwait -= 15
        appDelegate?.gameManager.attackPower = slamPow
        self.turn += 1
    }
    
    //CRUSH
    override func attack2(target: Character) {
        let accuracyroll = randomInt(min: 0, max: 100)
        var accuracy = 0.0
        if accuracyroll > 50 {
            accuracy = 0.0
        }
        else {
            accuracy = 1.0
        }
        let crushPow = ((50 - target.defense)/50) * (self.strength * randomDouble(min: 2.6, max: 2.7) * accuracy)
        target.hp = target.hp - crushPow
        if crushPow == 0 {
            print("Whiff! You missed!")
            self.turnwait -= 18
            appDelegate?.gameManager.attackPower = crushPow
            self.turn += 1
        }
        else {
            print("Crush...\(target.name) lost \(crushPow) HP")
            self.turnwait -= 18
            appDelegate?.gameManager.attackPower = crushPow
            self.turn += 1
        }
    }
    
    //FACESTOMP
    override func attack3(target: Character) {
        let stompPow = self.strength * 2
        target.hp = target.hp - stompPow
        print("In the faaaaace! \(target.name) lost \(stompPow) HP")
        appDelegate?.gameManager.attackPower = stompPow
        self.turn = 0
        self.turnwait -= 25
        pickerview?.reloadAllComponents()
    }
    
    override func get_attacks() -> [String] {
        return ["Bodyslam", "Crush"]
    }
    override func get_charge() -> [String] {
        return ["Facestomp"]
    }
}
