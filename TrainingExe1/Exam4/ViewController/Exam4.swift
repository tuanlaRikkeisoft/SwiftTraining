//
//  Exam4.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/20/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam4: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var items = [AVResultModel]()
    var canDeleteMode : Bool = false
    var canMoveMode : Bool = false
    let heightOfCell :CGFloat = 100.0
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.fakeData()
    }
    
    func setupUI(){
        tableView.register(UINib.init(nibName: "Exam4Cell", bundle: nil), forCellReuseIdentifier: "Exam4Cell")
    }
    
    // MARK: Fake Data
    func fakeData(){
        self.title = "Exam4"
        let av1 = AVResultModel.init(Date.init(), 2.1, 164)
        let av2 = AVResultModel.init(Date.init(), 2.5, 169)
        let av3 = AVResultModel.init(Date.init(), 1.1, 69)
        let av4 = AVResultModel.init(Date.init(), 2.0, 139)
        let av5 = AVResultModel.init(Date.init(), 2.0, 139)
        let av6 = AVResultModel.init(Date.init(), 2.0, 139)
        let av7 = AVResultModel.init(Date.init(), 2.0, 139)
        let av8 = AVResultModel.init(Date.init(), 2.0, 139)
        items = [av1,av2,av3,av4,av5,av6,av7,av8];
    }

    // MARK: Edit Action
    @IBAction func actionEdit(_ sender: Any) {
        canDeleteMode = !canDeleteMode
        if canDeleteMode {
            editButton.setTitle("Done", for: UIControlState.normal)
        }else{
            editButton.setTitle("Edit", for: UIControlState.normal)
        }
        tableView.reloadData()
    }
    // MARK: Move Action
    @IBAction func actionMove(_ sender: Any) {
        canMoveMode = !canMoveMode
        if canMoveMode {
            tableView.isEditing = true
            canDeleteMode = true
            moveButton.setTitle("Done", for: UIControlState.normal)
        }else{
            tableView.isEditing = false
            canDeleteMode = false
            moveButton.setTitle("Move", for: UIControlState.normal)
        }
        tableView.reloadData()
    }

    // MARK: TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = items[indexPath.row] as AVResultModel
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam4Cell") as? Exam4Cell
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.setModel(model)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canDeleteMode
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool{
        return canMoveMode
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemMove = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(itemMove, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            items.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailExam4()
        detailVC.model = items[indexPath.row]
        if (indexPath.row % 2 == 0) {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }else{
            self.navigationController?.present(detailVC, animated: true, completion: nil)
        }
    }
    
}
