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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadData() {
        self.circleLoading.start()
        service.getListDataWithClosure(key: self.key, type: "musicVideo") { (message, data) in
            self.medias = data
            self.tableView.reloadData()
            self.circleLoading.stop()
        }
    }
}
