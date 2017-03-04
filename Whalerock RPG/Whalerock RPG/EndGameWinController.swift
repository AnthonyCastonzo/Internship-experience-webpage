//
//  EndGameWinController.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 3/3/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//
import UIKit
import Foundation

class EndGameWinController: UIViewController {
    
    
    @IBOutlet weak var winMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        winMessage.text = "ENEMY IS DEAD. YOU WIN. CONGRATS."
        winMessage.textAlignment = NSTextAlignment.center
    }
    // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
