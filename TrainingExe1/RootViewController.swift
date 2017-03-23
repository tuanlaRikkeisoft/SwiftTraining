//
//  RootViewController.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/20/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func actionExam1(_ sender: Any) {
        self.navigationController?.pushViewController(Exam1(), animated: true)
    }

    @IBAction func actionExam2(_ sender: Any) {
        self.navigationController?.pushViewController(Exam2(), animated: true)
    }
    
    @IBAction func actionExam3(_ sender: Any) {
        self.navigationController?.pushViewController(Exam3Containner(), animated: true)
    }
    
    @IBAction func actionExam4(_ sender: Any) {
        self.navigationController?.pushViewController(Exam4(), animated: true)
    }
    
    @IBAction func actionExam5(_ sender: Any) {
        self.navigationController?.pushViewController(Exam4(), animated: true)
    }
    @IBAction func actionExam6(_ sender: Any) {
        self.navigationController?.pushViewController(Exam6(), animated: true)
    }
    @IBAction func actionExam7(_ sender: Any) {
        self.navigationController?.pushViewController(Exam7(), animated: true)
    }
    @IBAction func actionExam8(_ sender: Any) {
        self.navigationController?.pushViewController(RootExam8(), animated: true)
    }
    
    @IBAction func actionExam9(_ sender: Any) {
        self.navigationController?.pushViewController(RootExam8(), animated: true)
    }
    @IBAction func actionExam10(_ sender: Any) {
        let mainViewController = Exam10()
        let leftViewController = LeftViewController()
        SlideMenuOptions.leftViewWidth = 50
        SlideMenuOptions.contentViewScale = 0.50
        
        let slideMenuController = SlideMenuController(mainViewController: mainViewController, leftMenuViewController: leftViewController)
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = slideMenuController
    }
}
