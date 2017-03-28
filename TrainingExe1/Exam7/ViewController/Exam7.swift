//
//  Exam7.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import CoreData

class Exam7: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var items: [AVResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
        self.tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setupUI(){
        tableView.register(UINib.init(nibName: "Exam4Cell", bundle: nil), forCellReuseIdentifier: "Exam4Cell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addAction))
    }
    
    func loadData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        let request: NSFetchRequest<AVResult> = AVResult.fetchRequest()
        items = try context.fetch(request)
        } catch {
            print("Fetching Failed")
        }
    }
    func addAction(){
        self.navigationController?.present(AddAVResultViewController(), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entity = items[indexPath.row] as AVResult
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam4Cell") as? Exam4Cell
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.setEntity(entity)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
}
