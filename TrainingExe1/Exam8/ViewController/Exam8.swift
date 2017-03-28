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
    let heightOfCell :CGFloat = 90.0
    
    var songs = [Songs]()
    let service = Exam8Service.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI(){
        self.tableView.register(UINib.init(nibName: "Exam8Cell", bundle: nil), forCellReuseIdentifier: "Exam8Cell")
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
        return heightOfCell
    }
    
    // MARK: Search Bar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.search((searchBar.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!)
    }
    
    func search(_ keyString: String){
        fatalError("Must Override")
    }
    
    // MARK: show and hide UIACtivity Indicator View
    func loadingIndicator(_ show: Bool) {
        let tag = 1
        if show {
            self.view.alpha = 0.5
            let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
            indicator.center = view.center
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
