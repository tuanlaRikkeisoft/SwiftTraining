//
//  Exam8Notification.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam8Notification: Exam8 {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData(_:)), name: NSNotification.Name.init(rawValue: "getSongCompletedNotification"), object: nil)
    }

    // MARK: Call Service, get Data and binding to View
    override func search(_ keyString: String) {
        self.loadingIndicator(true)
        service.getListSongWithNotification(key: keyString)
    }
    
    func reloadData(_ notification: Notification){
        self.songs.removeAll()
        if let myData = notification.userInfo as? [String: Any]{
            self.songs = myData["listSongs"] as! [Songs]
        }
        self.tableView.reloadData()
        self.loadingIndicator(false)
    }
}
