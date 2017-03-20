//
//  Exam2.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/20/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam2: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameKataTextField: UITextField!
    @IBOutlet weak var lastNameKataTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var feMaleButton: UIButton!

    @IBAction func actionMale(_ sender: Any) {
        
    }
    @IBAction func actionFeMail(_ sender: Any) {
        
    }
    var firstName: String?
    var lastName: String?
    var firstNameKata: String?
    var lastNameKata: String?
    var emailKata: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}
