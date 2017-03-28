//
//  Exam3Containner.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam3Containner: UITabBarController, UITabBarControllerDelegate {

    let exam3Tab1 = Exam3()
    let exam3Tab2 = Exam3Tab2()
    let exam3Tab3 = Exam3Tab3()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: Setup TabBar with 3 tab
    func setupUI(){
        exam3Tab1.tabBarItem = UITabBarItem.init(title: "First", image: nil, selectedImage: nil)
        exam3Tab2.tabBarItem = UITabBarItem.init(title: "Second", image: nil, selectedImage: nil)
        exam3Tab3.tabBarItem = UITabBarItem.init(title: "Exersice 2", image: nil, selectedImage: nil)
        self.viewControllers = [exam3Tab1,exam3Tab2,exam3Tab3]
    }

}
