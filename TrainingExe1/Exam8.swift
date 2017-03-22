//
//  Exam8.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam8: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Songs]()
    let service = Exam8Service()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI(){
        self.tableView.register(UINib.init(nibName: "Exam8Cell", bundle: nil), forCellReuseIdentifier: "Exam8Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam8Cell") as? Exam8Cell
        let song = songs[indexPath.row]
        cell?.setModel(song)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadingIndicator(true)
        service.getListSongWithClosure(key: searchBar.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) { (message, data) in
            self.songs = data
            self.tableView.reloadData()
            self.loadingIndicator(false)
        }
    }
    
    func loadingIndicator(_ show: Bool) {
        let tag = 1
        if show {
            self.view.alpha = 0.5
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.view.bounds.size.height
            let buttonWidth = self.view.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            self.view.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.view.alpha = 1.0
            if let indicator = self.view.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
    
    
}
