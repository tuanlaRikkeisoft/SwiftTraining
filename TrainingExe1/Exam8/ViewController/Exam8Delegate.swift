//
//  Exam8Delegate.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam8Delegate: Exam8 ,Exam8ServiceDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.service.delegate = self 
    }

    func getDataCompleted(data: [Songs], message: String) {
        self.songs.removeAll()
        self.songs = data
        self.tableView.reloadData()
        self.loadingIndicator(false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func search(_ keyString: String) {
        self.loadingIndicator(true)
        service.getListSongWithDelegate(key: keyString)
    }
}

