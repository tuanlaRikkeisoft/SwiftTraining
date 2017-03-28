//
//  Exam3Cell.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam3Cell: UITableViewCell {

    @IBOutlet weak var resImageView: UIImageView!
    @IBOutlet weak var restNameLabel: UILabel!
    @IBOutlet weak var restReviewLabel: UILabel!
    @IBOutlet weak var restStarImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // MARK: Pass Model to UITableViewCell
    public func setModel(_ model:Exam3Model){
        self.resImageView.image = UIImage.init(named: model.imageName)
        self.restNameLabel.text? = model.name
        self.restReviewLabel.text? = model.numReviews
        self.restStarImageView.image = UIImage.init(named: model.rating)
        self.addressLabel.text? = model.address
        self.categoryLabel.text? = model.categories
        self.snippetLabel.text? = model.snippet
        self.distanceLabel.text? = model.distance
        
    }
    
}
