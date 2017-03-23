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


    @IBOutlet weak var enemy1Constraint: NSLayoutConstraint!
    @IBOutlet weak var user2Constraint: NSLayoutConstraint!

    @IBOutlet weak var user1Constraint: NSLayoutConstraint!
    @IBOutlet weak var user1: UIImageView!
    
    @IBOutlet weak var user2: UIImageView!
    
    @IBOutlet weak var user1HealthView: UIProgressView!
    @IBOutlet weak var user2HealthView: UIProgressView!
    @IBOutlet weak var enemyHealthView: UIProgressView!
    @IBOutlet weak var enemy1: UIImageView!
    @IBOutlet weak var pickerViews: UIView!
    @IBOutlet weak var user1moves: UIPickerView!
    @IBOutlet weak var user2moves: UIPickerView!
    
    @IBOutlet weak var user2HPLoss: UILabel!
    @IBOutlet weak var user1HPLoss: UILabel!
    @IBOutlet weak var enemyHPLoss: UILabel!
    @IBOutlet weak var user1HPLabel: UILabel!
    @IBOutlet weak var user2HPLabel: UILabel!
    
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
        user1char.pickerview = user1moves
        user2char.pickerview = user2moves
        user1HealthView.progressViewStyle = UIProgressViewStyle .bar
        user2HealthView.progressViewStyle = UIProgressViewStyle .bar
        enemyHealthView.progressViewStyle = UIProgressViewStyle .bar
        user1HealthView.trackTintColor = UIColor .white
        user2HealthView.trackTintColor = UIColor .white
        enemyHealthView.trackTintColor = UIColor .white
        user1HPLabel.text = "\(Int(user1char.hp))/\(Int(user1char.maxhp))"
        user2HPLabel.text = "\(Int(user2char.hp))/\(Int(user2char.maxhp))"
        enemyHPLoss.isHidden = true
        user1HPLoss.isHidden = true
        user2HPLoss.isHidden = true
        


    

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
                    DispatchQueue.main.async {
                        let enemyHealthRatio = (self.enemy1char.hp/self.enemy1char.maxhp)
                        self.enemyHealthView.setProgress(Float(enemyHealthRatio), animated: true)
                        let user1HealthRatio = (self.user1char.hp/self.user1char.maxhp)
                        self.user1HealthView.setProgress(Float(user1HealthRatio), animated: true)
                        let user2HealthRatio = (self.user2char.hp/self.user2char.maxhp)
                        self.user2HealthView.setProgress(Float(user2HealthRatio), animated: true)
                        self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                        self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                    }
                    user1char.turnwait += (user1char.speed + randomDouble(min: -1.0, max: 1.0))
                    user2char.turnwait += (user2char.speed + randomDouble(min: -1.0, max: 1.0))
                    enemy1char.turnwait += (enemy1char.speed + randomDouble(min: -1.0, max: 1.0))
                    sleep(1)
                    if (user1char.turnwait < 15 && user2char.turnwait < 15 && enemy1char.turnwait < 15) {
                        continue
                    }
                    else if (user1char.turnwait >= 15) {
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        DispatchQueue.main.async {
                            self.user1.translatesAutoresizingMaskIntoConstraints = false
                            self.user1Constraint.constant = 300
                            if self.user1char.turn >= 3 {
                                self.user1moves.reloadAllComponents()
                            }
                            self.pickerViews.isHidden = false
                            self.user1moves.isHidden = false
                            
                        }
                        print("Waiting for Response")
                        while appDelegate?.gameManager.moveSelected == nil {

                        }
                        print("move is set")
                        DispatchQueue.main.async {
                            self.enemyHPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                            self.enemyHPLoss.isHidden = false
                            self.user1Constraint.constant = 133
                            self.pickerViews.isHidden = true
                            self.user1moves.isHidden = true
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.enemyHPLoss.isHidden = true
                        }
                        appDelegate?.gameManager.moveSelected = nil
                    }
                    else if (user2char.turnwait >= 15){
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        DispatchQueue.main.async {
                            self.user2.translatesAutoresizingMaskIntoConstraints = false
                            self.user2Constraint.constant = 300
                            if self.user2char.turn >= 3 {
                                self.user2moves.reloadAllComponents()
                            }
                            self.pickerViews.isHidden = false
                            self.user2moves.isHidden = false
                        }
                        print("Waiting for Response")
                        while appDelegate?.gameManager.moveSelected == nil {

                        }
                        print("move is set")
                        DispatchQueue.main.async {
                            self.enemyHPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                            self.enemyHPLoss.isHidden = false
                            self.user2Constraint.constant = 28
                            self.pickerViews.isHidden = true
                            self.user2moves.isHidden = true
                            /*self.user2ChargeMeter.layer.addSublayer(user2turnFillerLayer)*/
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.enemyHPLoss.isHidden = true
                        }
                        appDelegate?.gameManager.moveSelected = nil
                    }
                    else if enemy1char.turnwait >= 15 {
                        DispatchQueue.main.async {
                            self.enemy1.translatesAutoresizingMaskIntoConstraints = false
                            self.enemy1Constraint.constant = 300
                        }
                        let attack_roll = randomInt(min: 0, max: 100)
                        sleep(1)
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
                            enemy1char.slap(user: user2char)
                        }
                        sleep(2)
                        DispatchQueue.main.async {
                            if ((attack_roll >= 78) || (attack_roll < 56 && attack_roll >= 28)) {
                                self.user1HPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                                self.user1HPLoss.isHidden = false
                            }
                            else if ((attack_roll < 78 && attack_roll >= 56) || (attack_roll < 28 && attack_roll >= 0)) {
                                self.user2HPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                                self.user2HPLoss.isHidden = false
                            }
                            self.enemy1Constraint.constant = 26
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.user1HPLoss.isHidden = true
                            self.user2HPLoss.isHidden = true
                        }
                    }
                }
            }
            if (user2char.hp > 0 && enemy1char.hp > 0 && user1char.hp <= 0) {
                while(user2char.hp > 0 && enemy1char.hp > 0) {
                    DispatchQueue.main.async {
                        self.user1char.hp = 0
                        self.user1.image = #imageLiteral(resourceName: "Skeleton")
                        let enemyHealthRatio = (self.enemy1char.hp/self.enemy1char.maxhp)
                        self.enemyHealthView.setProgress(Float(enemyHealthRatio), animated: true)
                        let user1HealthRatio = (self.user1char.hp/self.user1char.maxhp)
                        self.user1HealthView.setProgress(Float(user1HealthRatio), animated: true)
                        let user2HealthRatio = (self.user2char.hp/self.user2char.maxhp)
                        self.user2HealthView.setProgress(Float(user2HealthRatio), animated: true)
                        self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                        self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                    }
                    user2char.turnwait += (user2char.speed + randomDouble(min: -1.0, max: 1.0))
                    enemy1char.turnwait += (enemy1char.speed + randomDouble(min: -1.0, max: 1.0))
                    sleep(1)
                    if (user2char.turnwait >= 15){
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        DispatchQueue.main.async {
                            self.user2.translatesAutoresizingMaskIntoConstraints = false
                            self.user2Constraint.constant = 300
                            if self.user2char.turn >= 3 {
                                self.user2moves.reloadAllComponents()
                            }
                            self.pickerViews.isHidden = false
                            self.user2moves.isHidden = false
                        }
                        print("Waiting for Response")
                        while appDelegate?.gameManager.moveSelected == nil {
                            
                        }
                        print("move is set")
                        DispatchQueue.main.async {
                            self.enemyHPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                            self.enemyHPLoss.isHidden = false
                            self.user2Constraint.constant = 28
                            self.pickerViews.isHidden = true
                            self.user2moves.isHidden = true
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.enemyHPLoss.isHidden = true
                        }
                        appDelegate?.gameManager.moveSelected = nil
                    }
                    else if enemy1char.turnwait >= 15 {
                        DispatchQueue.main.async {
                            self.enemy1.translatesAutoresizingMaskIntoConstraints = false
                            self.enemy1Constraint.constant = 300
                        }
                        let attack_roll = randomInt(min: 0, max: 100)
                        sleep(1)
                        if (attack_roll <= 100 && attack_roll > 50) {
                            enemy1char.punch(user: user2char)
                        }
                        if (attack_roll <= 50 && attack_roll >= 0) {
                            enemy1char.slap(user: user2char)
                        }
                        sleep(2)
                        DispatchQueue.main.async {
                            self.user2HPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                            self.user2HPLoss.isHidden = false
                            self.enemy1Constraint.constant = 26
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.user2HPLoss.isHidden = true
                        }
                    }
                }
            }
            if (user1char.hp > 0 && user2char.hp <= 0 && enemy1char.hp > 0) {
                while (user1char.hp > 0 && enemy1char.hp > 0) {
                    DispatchQueue.main.async {
                        self.user2char.hp = 0
                        self.user2.image = #imageLiteral(resourceName: "Skeleton")
                        let enemyHealthRatio = (self.enemy1char.hp/self.enemy1char.maxhp)
                        self.enemyHealthView.setProgress(Float(enemyHealthRatio), animated: true)
                        let user1HealthRatio = (self.user1char.hp/self.user1char.maxhp)
                        self.user1HealthView.setProgress(Float(user1HealthRatio), animated: true)
                        let user2HealthRatio = (self.user2char.hp/self.user2char.maxhp)
                        self.user2HealthView.setProgress(Float(user2HealthRatio), animated: true)
                        self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                        self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                    }
                    user1char.turnwait += (user1char.speed + randomDouble(min: -1.0, max: 1.0))
                    enemy1char.turnwait += (enemy1char.speed + randomDouble(min: -1.0, max: 1.0))
                    sleep(1)
                    if (user1char.turnwait >= 15) {
                        print(user1char.name, Int(user1char.hp))
                        print(user2char.name, Int(user2char.hp))
                        DispatchQueue.main.async {
                            self.user1.translatesAutoresizingMaskIntoConstraints = false
                            self.user1Constraint.constant = 300
                            if self.user1char.turn >= 3 {
                                self.user1moves.reloadAllComponents()
                            }
                            self.pickerViews.isHidden = false
                            self.user1moves.isHidden = false
                            
                        }
                        print("Waiting for Response")
                        while appDelegate?.gameManager.moveSelected == nil {
                            
                        }
                        print("move is set")
                        DispatchQueue.main.async {
                            self.enemyHPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                            self.enemyHPLoss.isHidden = false
                            self.user1Constraint.constant = 133
                            self.pickerViews.isHidden = true
                            self.user1moves.isHidden = true
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.enemyHPLoss.isHidden = true
                        }
                        appDelegate?.gameManager.moveSelected = nil
                    }
                    else if enemy1char.turnwait >= 15 {
                        DispatchQueue.main.async {
                            self.enemy1.translatesAutoresizingMaskIntoConstraints = false
                            self.enemy1Constraint.constant = 300
                        }
                        let attack_roll = randomInt(min: 0, max: 100)
                        sleep(1)
                        if (attack_roll <= 100 && attack_roll > 50) {
                            enemy1char.punch(user: user1char)
                        }
                        if (attack_roll <= 50 && attack_roll >= 0) {
                            enemy1char.slap(user: user1char)
                        }
                        sleep(2)
                        DispatchQueue.main.async {
                            self.user1HPLoss.text = "\(Int(self.appDelegate!.gameManager.attackPower!))"
                            self.user1HPLoss.isHidden = false
                            self.enemy1Constraint.constant = 26
                            self.user1HPLabel.text = "\(self.user1char.name)  \(Int(self.user1char.hp))/\(Int(self.user1char.maxhp))"
                            self.user2HPLabel.text = "\(self.user2char.name)  \(Int(self.user2char.hp))/\(Int(self.user2char.maxhp))"
                        }
                        sleep(1)
                        DispatchQueue.main.async {
                            self.user1HPLoss.isHidden = true
                        }
                    }
                }
            }
            if (enemy1char.hp <= 0) {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "winSegue", sender: self)
                }
                print("Enemy is dead! You win!")
                break
            }
            if (user1char.hp <= 0 && user2char.hp <= 0) {
                DispatchQueue.main.async {
                self.performSegue(withIdentifier: "loseSegue", sender: self)
               }
                print("You are dead. Game over.")
                break
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
