//
//  Exam3Tab3.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam3Tab3: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var items =  [Exam3Model]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fakeData()
        self.setupTableView()
    }

    func setupTableView(){
        tableView.register(UINib.init(nibName: "Exam3Cell", bundle: nil), forCellReuseIdentifier: "Exam3Cell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = items[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exam3Cell") as? Exam3Cell
        cell?.setModel(model)
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }

    func fakeData(){
        let restaurant1 = Exam3Model()
        restaurant1.imageName = "khoai-tay.jpg"
        restaurant1.name = "Nhà hàng khoai tây chiên"
        restaurant1.rating = "3star.png"
        restaurant1.numReviews = "69 Reviews"
        restaurant1.address = "Đông Anh - Hà Nội -  Việt Nam"
        restaurant1.categories = "Đồ ăn nhanh"
        restaurant1.distance = "28km"
        restaurant1.snippet = "Khoai tây chiên là món rất dễ ăn sẽ làm cho cả nhà bạn ăn hoài mà không chán. Nhất là hôm nào có khách, bạn hãy thử trổ tài làm món này."
        
        let restaurant2 = Exam3Model()
        restaurant2.imageName = "pizza.jpg"
        restaurant2.name = "Nhà hàng pizza"
        restaurant2.rating = "4star.png"
        restaurant2.numReviews = "69 Reviews"
        restaurant2.address = "Đông Anh - Hà Nội -  Việt Nam"
        restaurant2.categories = "Đồ ăn nhanh"
        restaurant2.distance = "28km"
        restaurant2.snippet = "Pizza Hut (Hay còn được biết đến với tên gọi Pizza Hut, Inc.) Là một chuỗi nhà hàng của Mỹ được nhượng quyền thương mại quốc tế chuyên cung cấp các món ăn từ bánh pizza với các phong cách khác nhau, cùng với các món ăn phụ bao gồm mì ống, đùi bò, breadsticks, và bánh mì bơ tỏi. Pizza Hut là một công ty con của Yum! Brands, (công ty kinh doanh nhà hàng lớn nhất thế giới)"
        
        let restaurant3 = Exam3Model()
        restaurant3.imageName = "hamberger.jpeg"
        restaurant3.name = "Nhà hàng Hamberger"
        restaurant3.rating = "1star.png"
        restaurant3.numReviews = "69 Reviews"
        restaurant3.address = "Đông Anh - Hà Nội -  Việt Nam"
        restaurant3.categories = "Đồ ăn nhanh"
        restaurant3.distance = "28km"
        restaurant3.snippet = "A hamburger or burger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun."
        
        let restaurant4 = Exam3Model()
        restaurant4.imageName = "ca-hoi.jpg"
        restaurant4.name = "Nhà hàng Cá Hồi Nướng"
        restaurant4.rating = "5star.png"
        restaurant4.numReviews = "69 Reviews"
        restaurant4.address = "Đông Anh - Hà Nội -  Việt Nam"
        restaurant4.categories = "Đồ ăn nhanh"
        restaurant4.distance = "28km"
        restaurant4.snippet = "Cá hồi là tên chung cho nhiều loài cá thuộc họ Salmonidae. Nhiều loại cá khác cùng họ được gọi là trout (cá hồi); sự khác biệt thường được cho là cá hồi salmon di cư còn cá hồi trout không di cư, nhưng sự phân biệt này không hoàn toàn chính xác. Cá hồi sống dọc các bờ biển tại cả Bắc Đại Tây Dương (các họ di cư Salmo salar) và Thái Bình Dương (khoảng sáu họ của giống Oncorhynchus), và cũng đã từng được đưa tới Hồ lớn ở Bắc Mỹ. Cá hồi được sản xuất nhiều trong ngành nuôi trồng thủy sản ở nhiều nơi trên thế giới."
        
        let restaurant5 = Exam3Model()
        restaurant5.imageName = "khoai-tay.jpg"
        restaurant5.name = "Nhà hàng khoai tây chiên"
        restaurant5.rating = "3star.png"
        restaurant5.numReviews = "69 Reviews"
        restaurant5.address = "Đông Anh - Hà Nội -  Việt Nam"
        restaurant5.categories = "Đồ ăn nhanh"
        restaurant5.distance = "28km"
        restaurant5.snippet = "Khoai tây chiên là món rất dễ ăn sẽ làm cho cả nhà bạn ăn hoài mà không chán. Nhất là hôm nào có khách, bạn hãy thử trổ tài làm món này. Cứ phải gọi là khách nào cũng ngả nghiêng khen chồng có cô vợ khéo tay. Sau đây, xin chỉ giúp bạn 1 số hướng dẫn, cách rán (chiên) khoai tây ngon, giòn lâu như ở KFC."
        items.append(restaurant1)
        items.append(restaurant2)
        items.append(restaurant3)
        items.append(restaurant4)
        items.append(restaurant5)
        
    }

}
