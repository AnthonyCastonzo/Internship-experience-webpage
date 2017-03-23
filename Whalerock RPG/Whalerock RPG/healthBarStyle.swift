//
//  healthBarStyle.swift
//  Whalerock RPG
//
//  Created by Anthony Castonzo on 3/18/17.
//  Copyright © 2017 Anthony Castonzo. All rights reserved.
//

import Foundation
import UIKit

class HealthBarView: UIProgressView {
    var height: CGFloat = 1.0
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size:CGSize = CGSize.init(width: self.frame.size.width, height: height)
        
        return size
    }
}
