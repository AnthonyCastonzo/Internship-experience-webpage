//
//  endGame.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/27/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
/*
import UIKit
func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}
func randomDouble(min: Double, max:Double) -> Double {
    return min + Double(arc4random_uniform(UInt32(max - min + 1)))
}
import Foundation

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
        var healee: Character
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
            var revivee: Character
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
        var healee: Character
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
            var revivee: Character
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
        var healee: Character
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
            var revivee: Character
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
 */
