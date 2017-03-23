//
//  Exam10.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class Exam10: UIViewController ,SlideMenuControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.addLeftBarButtonWithImage(UIImage(named: "menu.png")!)
            slideMenuController.delegate? = self
        }
        
        // Open
        self.slideMenuController()?.openLeft()
        self.slideMenuController()?.openRight()
        
        // close
        self.slideMenuController()?.closeLeft()
        self.slideMenuController()?.closeRight()
    }
    
    
    func leftWillOpen(){
        
    }
    func leftDidOpen(){
        
    }
    func leftWillClose(){
        
    }
    func leftDidClose(){
        
    }
    func rightWillOpen(){
        
    }
    func rightDidOpen(){
        
    }
    func rightWillClose(){
        
    }
    func rightDidClose(){
        
    }

}
