//
//  EndGameLoseController.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 2/28/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//

import UIKit

class EndGameLoseController: UIViewController {


    @IBOutlet weak var loseMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loseMessage.text = "YOU ARE DEAD. YOU LOSE. SORRY."
        loseMessage.textAlignment = NSTextAlignment.center
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
