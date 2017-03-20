//
//  Exam1.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/20/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action1(_ sender: Any) {
        self.printHelloWorld()
    }
    
    @IBAction func action2(_ sender: Any) {
        self.printRectangleStar()
    }
    
    @IBAction func action3(_ sender: Any) {
        self.arraytest()
    }
    
    @IBAction func action4(_ sender: Any) {
        self.dictTest()
    }
   
    @IBAction func action5(_ sender: Any) {
        self.listDictTest()
    }
    
    
    
    public func printHelloWorld(){
        print("Hello World");
    }
    
   
    public func printRectangleStar(){
        for i in 0..<15 {
            for j in 0...12 {
                if (i==0 || i==14 || j == 0 || j == 11){
                    print("*",terminator:"")
                }else{
                    print(" ",terminator:"")
                }
            }
            print("\n")
        }
    }
    
    public func arraytest(){
        var items: [String] = ["Nguyen","Minh","Tien"]
        print("Items Before: \(items)")
        
        items.append("Dong")
        
        print("Item Affter Append: \(items)")
    }
    
    public func dictTest(){
        let dict: [String:String] = ["ten":"Nguyen Minh Tien","tuoi":"26","diachi":"Dong Anh - Ha Noi","sdt":"0966459666"]
        print("Ten cua em la: \(dict["ten"]!)")
    }
    
    public func listDictTest(){
        
        let user1: [String:String] = ["ten":"Nguyen Minh Tien","tuoi":"26","diachi":"Dong Anh - Ha Noi","sdt":"0966459666"]
        let user2: [String:String] = ["ten":"Nguyen Trong Cu","tuoi":"32","diachi":"Trung Quoc","sdt":"0989322322"]
        let user3: [String:String] = ["ten":"Nguyen Tuan Anh","tuoi":"29","diachi":"Hoang Mai - Ha Noi","sdt":"094939266"]
        let user4: [String:String] = ["ten":"Nguyen Trong Nghia","tuoi":"13","diachi":"Dong Anh - Ha Noi","sdt":"0903939366"]
        
        let items : [Dictionary<String,String>] = [user1,user2,user3,user4]
        
        print("\nThu Tu Truoc khi sap xep:")
        for item in items {
            print("\(item["ten"]!) : \(item["tuoi"]!)")
        }
        
        print("\nThu Tu Sau Khi Sap Xep:")
        let sortItems = items.sorted(by: { $0.0["tuoi"]! < $0.1["tuoi"]! })
        
        for item in sortItems{
            print("\(item["ten"]!) : \(item["tuoi"]!)")
        }
    }


}
