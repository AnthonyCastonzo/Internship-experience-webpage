//
//  User1picker.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 3/1/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//

import UIKit

class User1picker: NSObject, UIPickerViewDataSource {
    var character: Character!
    var moves: [String] = []
    init(character: Character) {
        self.character = character
        moves = self.character.get_attacks() + self.character.get_charge()
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if character.turn >= 3 {
            return moves.count
        }
        else {
            return moves.count - character.get_charge().count
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension User1picker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if character.turn >= 3 {
            return moves[row]
        }
        else {
            return character.get_attacks()[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        (UIApplication.shared.delegate as? AppDelegate)?.gameManager.moveSelected = moves[row]
        print(character.name)
        if row == 0 {
            character.attack1(target:((UIApplication.shared.delegate as? AppDelegate)?.gameManager.selectedenemy)!)
        }
        if row == 1 {
            character.attack2(target:((UIApplication.shared.delegate as? AppDelegate)?.gameManager.selectedenemy)!)
        }
        if row == 2 {
            character.attack3(target:((UIApplication.shared.delegate as? AppDelegate)?.gameManager.selectedenemy)!)
        }
    }
}
