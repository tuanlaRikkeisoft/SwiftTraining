//
//  LeftViewController.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case first
    case second
}

protocol LeftMenuProtocol {
    func changeViewController(_ menu: LeftMenu)
}


class LeftViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LeftMenuProtocol  {

    @IBOutlet weak var tableView: UITableView!
    
    var menus = ["Main", "First", "Seconds"]
    var mainViewController = UINavigationController.init(rootViewController: Exam10())
    var firstViewController =  UINavigationController.init(rootViewController:FirstViewController())
    var secondsViewController = UINavigationController.init(rootViewController:SecondsViewController())

    
    @IBAction func actionSendEmail(_ sender: Any) {
    }
    @IBOutlet weak var introLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "Exam10Cell", bundle: nil), forCellReuseIdentifier: "Exam10Cell")
    }

    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .first:
            self.slideMenuController()?.changeMainViewController(self.firstViewController, close: true)
        case .second:
            self.slideMenuController()?.changeMainViewController(self.secondsViewController, close: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam10Cell") as? Exam10Cell
        if (indexPath.section == 0) {
            cell!.title.text = "San Pham"
        }else{
            if indexPath.row == 0 {
                cell!.title.text = "Tin Tuc 1"
            }else{
                cell!.title.text = "Tin Tuc 2"
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView.init(frame: CGRect.zero)
        }
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.tableView.bounds.width, height: 50))
        headerView.backgroundColor = UIColor.groupTableViewBackground
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.changeViewController(.main)
        }else{
            if let menu = LeftMenu(rawValue: indexPath.row+1) {
                self.changeViewController(menu)
            }
        }
      
    }
    
}
