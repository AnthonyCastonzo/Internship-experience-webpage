//
//  battleSystem.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/27/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}
func randomDouble(min: Double, max:Double) -> Double {
    return min + Double(arc4random_uniform(UInt32(max - min + 1)))
}
 /*
import Foundation

if (u1.hp > 0 && u2.hp > 0 && t1.hp > 0) {
    while(u1.hp > 0 && u2.hp > 0 && t1.hp > 0) {
        u1.turnwait += (u1.speed + randomDouble(min: -1.0, max: 1.0))
        u2.turnwait += (u2.speed + randomDouble(min: -1.0, max: 1.0))
        t1.turnwait += (t1.speed + randomDouble(min: -1.0, max: 1.0))
        if (u1.turnwait < 15 && u2.turnwait < 15 && t1.turnwait < 15) {
            continue
        }
        if (u1.turnwait >= 15) {
            print(u1.name, Int(u1.hp))
            print(u2.name, Int(u2.hp))
            if u1.turn < 3 {
                print("Attack options are \(u1.get_attacks())")
            }
            if u1.turn >= 3{
                print("Attack options are \(u1.get_attacks()), \(u1.get_charge())")
            }
            let a = input ("Choose attack (%s):" %(u1.name))
            cmd = 'u1.{}(t1)'.format(a)
            try:
            eval(cmd)
            u1.turn += 1
            u1.turnwait = random.randint(0,5)
            except:
            print("invalid command")
        }
        else if (u2.turnwait >= 15){
            print(u1.name, Int(u1.hp))
            print(u2.name, Int(u2.hp))
            if u2.turn < 3 {
                print("Attack options are \(u2.get_attacks())")
            }
            if u2.turn >= 3 {
                print("Attack options are \(u2.get_attacks()), \(u2.get_charge())")
            }
            let a = input ("Choose attack (%s):" %(u2.name))
            cmd = 'u2.{}(t1)'.format(a)
            try:
            eval(cmd)
            u2.turn += 1
            u2.turnwait = randomInt(min: 0, max: 5)
            except:
            print("invalid command")
        }
        else if t1.turnwait >= 15 {
            let attack_roll = randomInt(min: 0, max: 100)
            var attack: String
            if attack_roll >=55 {
                attack = "punch"
            }
            if attack_roll < 55 {
                attack = "slap"
            }
            let attack_targ_roll = randomInt(min: 0, max: 100)
            if attack_targ_roll >= 50 {
                cmd ='t1.{}(u1)'.format(attack)
                eval(cmd)
            }
            if attack_targ_roll < 50 {
                cmd ='t1.{}(u2)'.format(attack)
                eval(cmd)
            }
            t1.turn += 1
            t1.turnwait = randomInt(min: 0, max: 5)
        }
    }
}

if (u2.hp > 0 && t1.hp > 0 && u1.hp <= 0) {
    while(u2.hp > 0 && t1.hp > 0) {
        u2.turnwait += (u2.speed + randomDouble(min: -1.0, max: 1.0))
        t1.turnwait += (t1.speed + randomDouble(min: -1.0, max: 1.0))
        if (u2.turnwait >= 15) {
            print(u1.name, 0)
            print(u2.name, Int(u2.hp))
            if u2.turn < 3 {
                print("Attack options are \(u2.get_attacks())")
            }
            if u2.turn >= 3 {
                print("Attack options are \(u2.get_attacks()), \(u2.get_charge())")
            }
            let a = input ("Choose attack (%s):" %(u2.name))
            cmd = 'u2.{}(t1)'.format(a)
            try:
            eval(cmd)
            u2.turn += 1
            u2.turnwait = randomInt(min: 0, max: 5)
            except:
            print("invalid command")
        }
        else if t1.turnwait >= 15 {
            let attack_roll = randomInt(min: 0, max: 100)
            var attack: String
            if attack_roll >=55 {
                attack = "punch"
            }
            if attack_roll < 55 {
                attack = "slap"
            }
            cmd ='t1.{}(u2)'.format(attack)
            eval(cmd)
            t1.turn += 1
            t1.turnwait = randomInt(min: 0, max: 5)
        }
    }
}

if (u1.hp > 0 && u2.hp <= 0 && t1.hp > 0) {
    while (u1.hp > 0 && t1.hp > 0) {
        u1.turnwait += (u1.speed + randomDouble(min: -1.0, max: 1.0))
        t1.turnwait += (t1.speed + randomDouble(min: -1.0, max: 1.0))
        if (u1.turnwait >= 15) {
            print(u1.name, Int(u1.hp))
            print(u2.name, Int(u2.hp))
            if u1.turn < 3 {
                print("Attack options are \(u1.get_attacks())")
            }
            if u1.turn >= 3{
                print("Attack options are \(u1.get_attacks()), \(u1.get_charge())")
            }
            let a = input ("Choose attack (%s):" %(u1.name))
            cmd = 'u1.{}(t1)'.format(a)
            try:
            eval(cmd)
            u1.turn += 1
            u1.turnwait = random.randint(0,5)
            except:
            print("invalid command")
        }
        else if t1.turnwait >= 15 {
            let attack_roll = randomInt(min: 0, max: 100)
            var attack: String
            if attack_roll >=55 {
                attack = "punch"
            }
            if attack_roll < 55 {
                attack = "slap"
            }
            cmd ='t1.{}(u1)'.format(attack)
            eval(cmd)
            t1.turn += 1
            t1.turnwait = randomInt(min: 0, max: 5)
        }
    }
}

*/
