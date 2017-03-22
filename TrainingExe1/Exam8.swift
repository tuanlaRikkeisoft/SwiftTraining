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
    
    var songs : [Songs]!
    
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam8Cell") as? Exam8Cell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
}
