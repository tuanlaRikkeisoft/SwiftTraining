//
//  Tab1.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/24/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
//musicVideo
class Tab1: BaseTab {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Call Service, get Data and binding to View (Music Video)
    override func loadData() {
        self.loadingIndicator(true)
        service.getListDataWithClosure(key: self.key, type: "musicVideo") { (message, data) in
            self.medias = data
            self.tableView.reloadData()
            self.loadingIndicator(false)
        }
    }
}
