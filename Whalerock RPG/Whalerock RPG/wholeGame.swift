//
//  chooseCharacter.swift
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
import Foundation

let z = Knight(namecall: "Knight", maxhit_points: 300, maxmana_points: 0, strg: 40, spd: 4, mag: 0, dfense: 5, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 300)
let b = Mage(namecall: "Mage", maxhit_points: 200, maxmana_points: 100, strg: 10, spd: 4, mag: 40, dfense: 2, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 200)
let c = Brute(namecall: "Brute", maxhit_points: 250, maxmana_points: 15, strg: 50, spd: 3, mag: 10, dfense: 5, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 200)
let ehp = randomDouble(min: 250, max: 400)

while true {
    levelnum += 1
    print("Level \(levelnum)")
    let e1 = Enemy(namecall: "Troll", maxhit_points: ehp, maxmana_points: 100, strg: randomDouble(min: 50, max: 80), spd: randomDouble(min: 3.0, max: 5.0), mag: randomDouble(min: 10.0, max: 40.0), dfense: randomDouble(min: 1, max: 5), turn_num: 1, turn_wait: 0, exp: 100, lev: 1, hit_points: ehp)
    print("\(e1.name) has attacked!")
    var u1choice: String
    var u2choice: String
    var u1: CharClass
    var u2: CharClass
    var t1: CharClass
    while true {
        let targ = input("Who is your target?:")
        if targ == "Troll" {
            t1 = e1
            break
        }
        else {
            continue
        }
    }

    print("Character choices are |Knight| |Mage|  |Brute|")
    while true {
        u1choice = input("Choose your first character:")
        if u1choice == "Knight" {
            u1 = z
            print("knight added to party")
            break
        }
        if u1choice == "Mage" {
            u1 = b
            print("mage added to party")
            break
        }
        if u1choice == "Brute" {
            u1 = c
            print("brute added to party")
            break
        }
        else {
            continue
        }
    }
    while true {
        u2choice = input("Choose your second character:")
        if u2choice == "Knight" {
            u2 = z
            if u2choice == u1choice {
                print("Already chosen. Select again.")
                continue
            }
            else {
                print("knight added to party")
                break
            }
        }
        if u2choice == "Mage" {
            u2 = b
            if u2choice == u1choice {
                print("Already chosen. Select again.")
                continue
            }
            else {
                print("mage added to party")
                break
            }
        }
        if u2choice == "Brute" {
            u2 = c
            if u2choice == u1choice {
                print("Already chosen. Select again.")
                continue
            }
            else {
                print("brute added to party")
                break
            }
        }
        else {
            continue
        }
    }
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
                let a = input ("Choose attack \(u1.name):")
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
    if (u1.hp <= 0 && u2.hp <= 0 && t1.hp > 0){
        print("\(u1.name) HP: 0")
        print('\(u2.name) HP: 0')
        print("You are dead. The game is over. Goodbye.")
        break
    }
    
    if (t1.hp <= 0 && u2.hp > 0 && u1.hp > 0) {
        u1.exp += (0.5 * t1.exp)
        u2.exp += (0.5 * t1.exp)
        if u1.exp >= 100 {
            u1.levelup()
            u1.exp = 0
        }
        if u2.exp >= 100 {
            u2.levelup()
            u2.exp = 0
        }
        print("\(t1.name) is dead. Congratulations.")
        print ("\(u1.name) exp: \(u1.exp)")
        print ("\(u2.name) exp: \(u2.exp)")
        print("\(u1.name) HP: \(u1.hp)")
        print("\(u2.name) HP: \(u2.hp)")
        while true {
            let item = input('Use item? |potion| |phoenixdown|:')
            var healee: CharClass
            if item == ('potion') {
                let healee_name = input('On whom?:')
                if healee_name == u1.name {
                    healee = u1
                }
                else if healee_name == u2.name {
                    healee = u2
                }
                else {
                    print("Not in your party!")
                    continue
                }
                if potionInv > 0 {
                    potion(healee)
                }
                else {
                    print("None left!")
                    continue
                }
            }
            if item == ('phoenixdown') {
                let revivee_name = input('On whom?:')
                var revivee: CharClass
                if revivee_name == u1.name {
                    revivee = u1
                }
                else if revivee_name == u2.name {
                    revivee = u2
                }
                else {
                    print ("Not in your party!")
                    continue
                }
                if phoenixdownInv > 1 {
                    phoenixdown(healee)'
                }
                else {
                    print("None left!")
                    continue
                }
            }
            if item == ('no') {
                break
            }
            else{
                print("Not an item!")
            }
        }
    }
    
    if (t1.hp <= 0 && u2.hp <= 0 && u1.hp > 0) {
        u1.exp += t1.exp
        if u1.exp >= 100 {
            u1.levelup()
            u1.exp = 0
        }
        print("\(t1.name) is dead. Congratulations.")
        print ("\(u1.name) exp: \(u1.exp)")
        print("\(u1.name) HP: \(u1.hp)")
        print("\(u2.name) HP: 0")
        while true {
            let item = input('Use item? |potion| |phoenixdown|:')
            var healee: CharClass
            if item == ('potion') {
                let healee_name = input('On whom?:')
                if healee_name == u1.name {
                    healee = u1
                }
                else if healee_name == u2.name {
                    healee = u2
                }
                else {
                    print("Not in your party!")
                    continue
                }
                if potionInv > 0 {
                    potion(healee)
                }
                else {
                    print("None left!")
                    continue
                }
            }
            if item == ('phoenixdown') {
                let revivee_name = input('On whom?:')
                var revivee: CharClass
                if revivee_name == u1.name {
                    revivee = u1
                }
                else if revivee_name == u2.name {
                    revivee = u2
                }
                else {
                    print ("Not in your party!")
                    continue
                }
                if phoenixdownInv > 1 {
                    phoenixdown(healee)'
                }
                else {
                    print("None left!")
                    continue
                }
            }
            if item == ('no') {
                break
            }
            else{
                print("Not an item!")
            }
        }
    }
    
    if (t1.hp <= 0 && u2.hp > 0 && u1.hp <= 0) {
        u2.exp += t1.exp
        if u2.exp >= 100 {
            u2.levelup()
            u2.exp = 0
        }
        print("\(t1.name) is dead. Congratulations.")
        print ("\(u2.name) exp: \(u2.exp)")
        print("\(u1.name) HP: 0)")
        print("\(u2.name) HP: \(u2.hp)")
        while true {
            let item = input('Use item? |potion| |phoenixdown|:')
            var healee: CharClass
            if item == ('potion') {
                let healee_name = input('On whom?:')
                if healee_name == u1.name {
                    healee = u1
                }
                else if healee_name == u2.name {
                    healee = u2
                }
                else {
                    print("Not in your party!")
                    continue
                }
                if potionInv > 0 {
                    potion(healee)
                }
                else {
                    print("None left!")
                    continue
                }
            }
            if item == ('phoenixdown') {
                let revivee_name = input('On whom?:')
                var revivee: CharClass
                if revivee_name == u1.name {
                    revivee = u1
                }
                else if revivee_name == u2.name {
                    revivee = u2
                }
                else {
                    print ("Not in your party!")
                    continue
                }
                if phoenixdownInv > 1 {
                    phoenixdown(healee)'
                }
                else {
                    print("None left!")
                    continue
                }
            }
            if item == ('no') {
                break
            }
            else{
                print("Not an item!")
            }
        }
    }
}
