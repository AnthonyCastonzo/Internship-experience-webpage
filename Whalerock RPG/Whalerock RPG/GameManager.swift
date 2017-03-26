//
//  GameManager.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation
class GameManager {
    var selectedcharacters = Set<Character>()
    var selectedenemy = Enemy(level: 1)
    var gamelevel = 1
    var knightlevel = 1
    var magelevel = 1
    var brutelevel = 1
    var moveSelected:String?
    var attackPower:Double!
    var attackAnimation:UIImage!
    var enemyParty: [Character] = []
}
