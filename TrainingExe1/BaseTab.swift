//
//  BaseTab.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/24/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class BaseTab: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let circleLoading = CircleLoading()
    var activityIndicator = UIActivityIndicatorView()

    
    let service = Exam10Service.sharedInstance
    var medias = [MediaModel]()
    let key = "sex"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.circleLoading)
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.medias.removeAll()
        self.loadData()
    }
    
    
    func loadData(){
        fatalError("Must Override")
    }
    
    func setupUI(){
        self.tableView.register(UINib.init(nibName: "Exam10MediaCell", bundle: nil), forCellReuseIdentifier: "Exam10MediaCell")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam10MediaCell") as? Exam10MediaCell
        let media = medias[indexPath.row]
        cell?.setModel(media)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
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
