//
//  RootExam8.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class RootExam8: UIViewController {

    @IBAction func actionDelegate(_ sender: Any) {
        self.navigationController?.pushViewController(Exam8Delegate(), animated: true)
    }
    
    @IBAction func actionClosure(_ sender: Any) {
        self.navigationController?.pushViewController(Exam8Closure(), animated: true)
    }
    
    @IBAction func actionNotification(_ sender: Any) {
        self.navigationController?.pushViewController(Exam8Notification(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
