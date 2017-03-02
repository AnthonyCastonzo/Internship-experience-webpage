//
//  Characterclass.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/27/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
var levelnum = 0
func ==(lhs: Character, rhs: Character) -> Bool {
    return lhs.id == rhs.id
}

class Character: Hashable {
    var id: Int
    var name: String
    var maxhp: Double
    var maxmp: Double
    var strength: Double
    var speed: Double
    var magic: Double
    var defense: Double
    var turn: Int
    var turnwait: Double
    var exp: Double
    var level: Int
    var hp: Double
    var image: UIImage?
    var hashValue: Int {
        return self.id
    }
    
    init(namecall: String, maxhit_points: Double, maxmana_points: Double, strg: Double, spd: Double, mag: Double, dfense: Double, turn_num: Int, turn_wait: Double, exp: Double, lev: Int, hit_points: Double, id: Int) {
        self.name = namecall
        self.maxhp = maxhit_points
        self.maxmp = maxmana_points
        self.strength = strg
        self.speed = spd
        self.magic = mag
        self.defense = dfense
        self.turn = turn_num
        self.turnwait = turn_wait
        self.exp = exp
        self.level = lev
        self.hp = hit_points
        self.id = id
    }
    
    func setLevel(value: Int) {
        self.level = value
        (self.maxhp) += Double(value) * (0.10 * (self.maxhp))
        (self.maxmp) += Double(value) * (0.10 * (self.maxmp))
        (self.strength) += Double(value) * (0.10 * (self.strength))
        (self.speed) += Double(value) * (0.10 * (self.speed))
        (self.magic) += Double(value) * (0.10 * (self.magic))
        (self.defense) += Double(value) * (0.10 * (self.defense))
    }
    
    func attack1(target: Character) {
        print("nothing")
    }
    
    func attack2(target: Character) {
        print("nothing")
    }
    
    func attack3(target: Character) {
        print("nothing")
    }
    
    func defend() {
        print("I am defending")
    }
    
    open func get_attacks() ->[String] {
        return []
    }
    open func get_charge() -> [String] {
        return []
    }
}





