//
//  chooseCharacter.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
/*
import UIKit
import Foundation

let z = Knight(namecall: "Knight", maxhit_points: 300, maxmana_points: 0, strg: 40, spd: 4, mag: 0, dfense: 5, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 300)
let b = Mage(namecall: "Mage", maxhit_points: 200, maxmana_points: 100, strg: 10, spd: 4, mag: 40, dfense: 2, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 200)
let c = Brute(namecall: "Brute", maxhit_points: 250, maxmana_points: 15, strg: 50, spd: 3, mag: 10, dfense: 5, turn_num: 1, turn_wait: 0, exp: 0, lev: 1, hit_points: 200)
let ehp = randomDouble(min: 250, max: 400)

let e1 = Enemy(namecall: "Troll", maxhit_points: ehp, maxmana_points: 100, strg: randomDouble(min: 50, max: 80), spd: randomDouble(min: 3.0, max: 5.0), mag: randomDouble(min: 10.0, max: 40.0), dfense: randomDouble(min: 1, max: 5), turn_num: 1, turn_wait: 0, exp: 100, lev: 1, hit_points: ehp)
print("\(e1.name) has attacked!")
var u1choice: String
var u2choice: String
var u1: Character
var u2: Character
var t1: Character
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

*/

