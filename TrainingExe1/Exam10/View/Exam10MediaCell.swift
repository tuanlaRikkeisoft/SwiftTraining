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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: Pass data from model to UITableViewCell
    
    public func setModel(_ model: MediaModel){
        self.trackName.text = model.trackName
        self.artistName.text = model.artistName
        Manager.shared.loadImage(with: URL.init(string:model.thumbImage!)!, into: self.thumbImageView)
    }
    
}
