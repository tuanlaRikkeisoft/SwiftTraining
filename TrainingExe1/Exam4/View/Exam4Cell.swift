//
//  Exam4Cell.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import CoreData

class Exam4Cell: UITableViewCell {

    @IBOutlet weak var imageThumbView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avValueLabel: UILabel!
    @IBOutlet weak var loviValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageThumbView.layer.borderWidth = 0.5
        self.imageThumbView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // MARK: Pass value from Model to UITableViewCell
    public func setModel(_ model: AVResultModel){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm"
        self.dateLabel.text? = dateFormatter.string(from: model.captureDate)
        self.avValueLabel.text? = "AV \(model.avValue.description)"
        self.loviValueLabel.text? = model.loviValue.description
    }

    // MARK: Pass value from Entity to UITableViewCell
    public func setEntity(_ entity: AVResult){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm"
        self.dateLabel.text? = dateFormatter.string(from: entity.captureDate as! Date)
        self.avValueLabel.text? = "AV \(String(entity.avValue))"
        self.loviValueLabel.text? = String(entity.loviValue)
    }
}
