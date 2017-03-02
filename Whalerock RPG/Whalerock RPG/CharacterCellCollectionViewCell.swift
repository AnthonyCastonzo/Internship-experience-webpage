//
//  CharacterCellCollectionViewCell.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//

import UIKit

class CharacterCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    var character: Character? {
        didSet{
            characterImage.image = character?.image
            characterName.text = character?.name
        }
    }
    var highlight: Bool = false {
        didSet{
            if highlight == true {
                self.layer.borderColor = UIColor.white.cgColor
                self.layer.borderWidth = 5
            }
            else {
                self.layer.borderWidth = 0
            }
        }
    }
}
