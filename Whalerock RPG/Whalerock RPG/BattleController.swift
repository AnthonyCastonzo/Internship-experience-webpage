//
//  BattleController.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//

import Foundation
import UIKit
class BattleController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var user1char: Character!
    var user2char: Character!
    var enemy1char: Enemy!
    var user1pickerview: User1picker!
    var user2pickerview: User1picker!
    var selectedcharacters = Set<Character>() {
        didSet {
            for (index, char) in selectedcharacters.enumerated() {
                if index == 0 {
                    user1char = char
                    user1.image = char.image
                }
                else {
                    user2char = char
                    user2.image = char.image
                }
            }
        }
    }
    
    
    @IBOutlet weak var user1: UIImageView!
    
    @IBOutlet weak var user2: UIImageView!
    
    @IBOutlet weak var enemy1: UIImageView!
    @IBOutlet weak var pickerViews: UIView!
    @IBOutlet weak var user1moves: UIPickerView!
    @IBOutlet weak var user2moves: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedcharacters = (appDelegate?.gameManager.selectedcharacters)!
        user1char = selectedcharacters[selectedcharacters.index(selectedcharacters.startIndex, offsetBy: 0)]
        user2char = selectedcharacters[selectedcharacters.index(selectedcharacters.startIndex, offsetBy: 1)]
        enemy1char = (appDelegate?.gameManager.selectedenemy)!
        enemy1.image = enemy1char.image
        user1pickerview = User1picker.init(character: user1char)
        user2pickerview = User1picker.init(character: user2char)
        user1moves.dataSource = user1pickerview
        user1moves.delegate = user1pickerview
        user2moves.dataSource = user2pickerview
        user2moves.delegate = user2pickerview

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pickerViews.isHidden = true
        user1moves.isHidden = true
        user2moves.isHidden = true
        DispatchQueue.global().async {
            self.startBattle()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func startBattle() {
        while true {
            if (user1char.hp > 0 && user2char.hp > 0 && enemy1char.hp > 0) {
                while(user1char.hp > 0 && user2char.hp > 0 && enemy1char.hp > 0) {
                    user1char.turnwait += (user1char.speed + randomDouble(min: -1.0, max: 1.0))
                    user2char.turnwait += (user2char.speed + randomDouble(min: -1.0, max: 1.0))
                    enemy1char.turnwait += (enemy1char.speed + randomDouble(min: -1.0, max: 1.0))
                    if (user1char.turnwait < 15 && user2char.turnwait < 15 && enemy1char.turnwait < 15) {
                        continue
                    }
                    if (user1char.turnwait >= 15) {
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        DispatchQueue.main.async {
                            self.pickerViews.isHidden = false
                            self.user1moves.isHidden = false
                        }
                        print("Waiting for Response")
                        while appDelegate?.gameManager.moveSelected == nil {

                        }
                        print("move is set")
                        print(user1char.turn)
                        print(user1char.turnwait)
                        DispatchQueue.main.async {
                            self.pickerViews.isHidden = true
                            self.user1moves.isHidden = true
                        }
                        appDelegate?.gameManager.moveSelected = nil
 
                    }
                    if (user2char.turnwait >= 15){
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        DispatchQueue.main.async {
                            self.pickerViews.isHidden = false
                            self.user2moves.isHidden = false
                        }
                        print("Waiting for Response")
                        while appDelegate?.gameManager.moveSelected == nil {

                        }
                        print("move is set")
                        print(user2char.turn)
                        print(user2char.turnwait)
                        DispatchQueue.main.async {
                            self.pickerViews.isHidden = true
                            self.user2moves.isHidden = true
                        }
                        appDelegate?.gameManager.moveSelected = nil
                        
                    }
                    if enemy1char.turnwait >= 15 {
                        let attack_roll = randomInt(min: 0, max: 100)
                        if attack_roll >= 78 {
                            enemy1char.punch(user: user1char)
                        }
                        if (attack_roll < 78 && attack_roll >= 56) {
                            enemy1char.punch(user: user2char)
                        }
                        if (attack_roll < 56 && attack_roll >= 28) {
                            enemy1char.slap(user: user1char)
                        }
                        if (attack_roll < 28 && attack_roll >= 0) {
                            enemy1char.slap(user: user1char)
                        }
                    }
                }
            }
            if (user2char.hp > 0 && enemy1char.hp > 0 && user1char.hp <= 0) {
                user1.image = #imageLiteral(resourceName: "Skeleton")
                while(user2char.hp > 0 && enemy1char.hp > 0) {
                    user2char.turnwait += (user2char.speed + randomDouble(min: -1.0, max: 1.0))
                    enemy1char.turnwait += (enemy1char.speed + randomDouble(min: -1.0, max: 1.0))
                    if (user2char.turnwait >= 15){
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        pickerViews.isHidden = false
                        user2moves.isHidden = false
                        user2char.turn += 1
                    }
                    else if enemy1char.turnwait >= 15 {
                        let attack_roll = randomInt(min: 0, max: 100)
                        if (attack_roll <= 100 && attack_roll > 50) {
                            enemy1char.punch(user: user2char)
                        }
                        if (attack_roll <= 50 && attack_roll >= 0) {
                            enemy1char.slap(user: user2char)
                        }
                    }
                }
            }
            if (user1char.hp > 0 && user2char.hp <= 0 && enemy1char.hp > 0) {
                user2.image = #imageLiteral(resourceName: "Skeleton")
                while (user1char.hp > 0 && enemy1char.hp > 0) {
                    user1char.turnwait += (user1char.speed + randomDouble(min: -1.0, max: 1.0))
                    enemy1char.turnwait += (enemy1char.speed + randomDouble(min: -1.0, max: 1.0))
                    if (user1char.turnwait >= 15) {
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        pickerViews.isHidden = false
                        user1moves.isHidden = false
                        user1char.turn += 1
                    }
                    else if enemy1char.turnwait >= 15 {
                        let attack_roll = randomInt(min: 0, max: 100)
                        if (attack_roll <= 100 && attack_roll > 50) {
                            enemy1char.punch(user: user2char)
                        }
                        if (attack_roll <= 50 && attack_roll >= 0) {
                            enemy1char.slap(user: user2char)
                        }
                    }
                }
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
