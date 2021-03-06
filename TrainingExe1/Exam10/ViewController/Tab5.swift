//
//  Tab5.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/24/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Tab5: BaseTab {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Call Service, get Data and binding to View (PostCast)
    override func loadData() {
        self.loadingIndicator(true)
        service.getListDataWithClosure(key: self.key, type: "podcast") { (message, data) in
            self.medias = data
            self.tableView.reloadData()
            self.loadingIndicator(false)
        }
    }
    
}
