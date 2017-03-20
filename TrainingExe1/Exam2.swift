//
//  Exam2.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/20/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam2: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameKataTextField: UITextField!
    @IBOutlet weak var lastNameKataTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var feMaleButton: UIButton!

    @IBOutlet weak var tel1TextField: UITextField!
    @IBOutlet weak var tel2TextField: UITextField!
    @IBOutlet weak var tel3TextField: UITextField!

    
    @IBAction func actionMale(_ sender: Any) {
        
    }
    @IBAction func actionFeMail(_ sender: Any) {
        
    }
    
    @IBAction func actionRegister(_ sender: Any) {
        
    }
    
    @IBAction func touchDateOfBirth(_ sender: Any) {
      
    }
    var firstName = String()
    var lastName = String()
    var firstNameKata = String()
    var lastNameKata = String()
    var email = String()
    var sexual = Bool()
    
    var tel1 = String()
    var tel2 = String()
    var tel3 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        firstNameKataTextField.delegate = self
        lastNameKataTextField.delegate = self;
        emailTextField.delegate = self;
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        tel1TextField.delegate = self;
        tel1TextField.keyboardType = UIKeyboardType.phonePad;
        tel2TextField.delegate = self;
        tel2TextField.keyboardType = UIKeyboardType.phonePad;
        tel3TextField.delegate = self;
        tel3TextField.keyboardType = UIKeyboardType.phonePad;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let resultString = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if textField == firstNameTextField {
            self.firstName = resultString
        }else if textField == lastNameTextField {
            self.lastName = resultString
        }else if textField == firstNameKataTextField{
            self.firstNameKata = resultString
        }else if textField == lastNameKataTextField{
            self.lastNameKata = resultString
        }else if textField == emailTextField{
            self.email = resultString
        }else if textField == tel1TextField{
            self.tel1 = resultString
        }else if textField == tel2TextField{
            self.tel2 = resultString
        }else if textField == tel3TextField{
            self.tel3 = resultString
        }
        else{
            print("OK");
        }
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateOfBirthTextField {
            let datePicker = UIDatePicker()
            dateOfBirthTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        }
    }
    func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateOfBirthTextField.text = dateFormatter.string(from: sender.date)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}
