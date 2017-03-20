//
//  RootViewController.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/20/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

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

}
