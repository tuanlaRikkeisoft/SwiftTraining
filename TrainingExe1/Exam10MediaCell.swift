//
//  Exam10MediaCell.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/24/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam10MediaCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var trackName: UILabel!

    @IBOutlet weak var artistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func setModel(_ model: MediaModel){
        self.trackName.text = model.trackName
        self.artistName.text = model.artistName
        self.thumbImageView.setImageFrom(imageURLString: model.thumbImage!, completionHandler: nil)
    }
    
}
