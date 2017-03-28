//
//  Exam8Closure.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam8Closure: Exam8 {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Call Service, get Data and binding to View
    override func search(_ keyString: String) {
        self.loadingIndicator(true)
        self.songs.removeAll()
        service.getListSongWithClosure(key:keyString) { (message, data) in
            self.songs = data
            self.tableView.reloadData()
            self.loadingIndicator(false)
        }
    }
}
