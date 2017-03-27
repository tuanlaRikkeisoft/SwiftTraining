//
//  Exam8Cell.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam8Cell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var trackGenreLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    var song : Songs!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func setModel(_ model: Songs){
        song = model
        trackNameLabel.text? = song.trackName!
        collectionNameLabel.text? = song.artistName!
        Manager.shared.loadImage(with: URL.init(string:song.artworkUrl100!)!, into: self.thumbImageView)
    }
    
}

