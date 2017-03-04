//
//  ViewController.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/27/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//

import UIKit

class CharSelectionController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var characters: [Character] = [Knight(level: 1), Mage(level: 1), Brute(level: 1)]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        startButton.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension CharSelectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as? CharacterCellCollectionViewCell
        cell?.character = characters[indexPath.item]
        return cell!
    }
}

extension CharSelectionController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let cell = collectionView.cellForItem(at: indexPath) as? CharacterCellCollectionViewCell
        if cell?.highlight == false {
            if (appDelegate?.gameManager.selectedcharacters.count)! >= 2 {
                let alert = UIAlertController.init(title: "Too Many", message: "You can only select 2 characters", preferredStyle: .alert)
                let alertaction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
                alert.addAction(alertaction)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                appDelegate?.gameManager.selectedcharacters.insert(characters[indexPath.item])
                cell?.highlight = true
            }
        }
        else {
            cell?.highlight = false
            let _ = appDelegate?.gameManager.selectedcharacters.remove((cell?.character)!)
            /*
            for (index, char) in appDelegate?.gameManager.selectedcharacters{
            if char.
            }

            appDelegate?.gameManager.selectedcharacters.fore
  */
        }
        if (appDelegate?.gameManager.selectedcharacters.count)! < 2 {
            startButton.isHidden = true
        }
        else {
            startButton.isHidden = false
        }
        print(appDelegate?.gameManager.selectedcharacters ?? "not available")
    }
}

