//
//  DetailExam4.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class DetailExam4: UIViewController {
    
    public var model : AVResultModel?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avValueLabel: UILabel!
    @IBOutlet weak var loviValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindingData()
    }
    
    func bindingData(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm"
        self.dateLabel.text? = dateFormatter.string(from: (model?.captureDate)!)
        self.avValueLabel.text = model?.avValue.description
        self.loviValueLabel.text = model?.loviValue.description
    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
