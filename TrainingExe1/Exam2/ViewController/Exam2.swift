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
    
    var firstName = String()
    var lastName = String()
    var firstNameKata = String()
    var lastNameKata = String()
    var email = String()
    var sexual : Bool = true
    var dateOfBirth = String()
    var tel1 = String()
    var tel2 = String()
    var tel3 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        firstNameKataTextField.delegate = self
        lastNameKataTextField.delegate = self
        emailTextField.delegate = self
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        dateOfBirthTextField.delegate = self
        tel1TextField.delegate = self
        tel1TextField.keyboardType = UIKeyboardType.phonePad
        tel2TextField.delegate = self
        tel2TextField.keyboardType = UIKeyboardType.phonePad
        tel3TextField.delegate = self
        tel3TextField.keyboardType = UIKeyboardType.phonePad
        maleButton.setImage(UIImage.init(named: "radio-selected.png"), for: UIControlState.normal)
        feMaleButton.setImage(UIImage.init(named: "radio-not-selected.png"), for: UIControlState.normal)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Exam2.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: TextField Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        let resultString = textField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if textField == firstNameTextField {
            firstName = resultString
        }else if textField == lastNameTextField {
            lastName = resultString
        }else if textField == firstNameKataTextField{
            firstNameKata = resultString
        }else if textField == lastNameKataTextField{
            lastNameKata = resultString
        }else if textField == emailTextField{
            email = resultString
        }else if textField == dateOfBirthTextField{
            dateOfBirth = resultString
        }else if textField == tel1TextField{
            tel1 = resultString
        }else if textField == tel2TextField{
            tel2 = resultString
        }else if textField == tel3TextField{
            tel3 = resultString
        }else{
            print("")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateOfBirthTextField {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date
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
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func actionMale(_ sender: Any) {
        sexual = true
        maleButton.setImage(UIImage.init(named: "radio-selected.png"), for: UIControlState.normal)
        feMaleButton.setImage(UIImage.init(named: "radio-not-selected.png"), for: UIControlState.normal)
    }
    
    @IBAction func actionFeMail(_ sender: Any) {
        sexual = false
        maleButton.setImage(UIImage.init(named: "radio-not-selected.png"), for: UIControlState.normal)
        feMaleButton.setImage(UIImage.init(named: "radio-selected.png"), for: UIControlState.normal)
    }
    
    @IBAction func actionRegister(_ sender: Any) {
        self.view!.endEditing(true)
        let message = self.checkValidate()
        if  message.characters.count > 0 {
            self.showAlertWithMessage(message)
        }else{
            self.showAlertWithMessage("Đăng ký thành công")
        }
    }
    
    // MARK: Validate Required
    func checkValidate() -> String {
        var message = String()
        if firstName.characters.count < 1 || lastName.characters.count < 1 || firstNameKata.characters.count < 1 || lastNameKata.characters.count < 1 || email.characters.count < 1 || dateOfBirth.characters.count < 1 || tel1.characters.count < 1 || tel2.characters.count < 1 || tel3.characters.count < 1 {
            message = "Chưa nhập đủ đầu vào"
        }else if (email.characters.count>0  && !isValidEmail(testStr: email))  {
            message = "Email sai định dạng"
        }else{
            message = String()
        }
        return message
    }
    
    // MARK: Validate Email
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // MARK: Show Alert Message
    func showAlertWithMessage(_ message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Keyboard Detech Show and Hide
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height/4
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height/4
            }
        }
    }
}
