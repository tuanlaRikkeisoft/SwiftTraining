//
//  AddAVResultViewController.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import CoreData

class AddAVResultViewController: UIViewController , UITextFieldDelegate{

    
    @IBOutlet weak var captureDateTextField: UITextField!
    @IBOutlet weak var avValueTextField: UITextField!
    @IBOutlet weak var loviValueTextField: UITextField!
    
    var captureDate = Date()
    var avValue = String()
    var loviValue  = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI(){
        self.captureDateTextField.delegate = self
        self.avValueTextField.delegate = self
        self.loviValueTextField.delegate = self

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let resultString = textField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if textField == avValueTextField {
            self.avValue = resultString
        }else if textField == loviValueTextField {
            self.loviValue = resultString
        }else{
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == captureDateTextField {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.dateAndTime
            captureDateTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        }
    }
    func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
        captureDateTextField.text = dateFormatter.string(from: sender.date)
        captureDate = sender.date
    }

    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }

    @IBAction func actionSubmit(_ sender: Any) {
        self.view!.endEditing(true)
        print("AV: \(self.avValue)\nLovi:\(loviValue)")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newAVResult = AVResult(context: context)
        newAVResult.avValue = Float(self.avValue)!
        newAVResult.loviValue = Int16(self.loviValue)!
        newAVResult.captureDate = self.captureDate as NSDate?
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.dismiss(animated: true, completion: nil)
}
    
    
}
