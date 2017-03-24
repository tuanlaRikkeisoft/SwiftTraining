//
//  Exam10.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/23/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class Exam10: UIViewController ,CAPSPageMenuDelegate{
    
    var pageMenu : CAPSPageMenu?
    var controllerArray : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.delegate? = self
        }
    
        let tab1 = Tab1()
        tab1.title = "Music Video"
        let tab2 = Tab2()
        tab2.title = "Movie"
        let tab3 = Tab3()
        tab3.title = "Ebook"
        let tab4 = Tab4()
        tab4.title = "Audio Book"
        let tab5 = Tab5()
        tab5.title = "PodCast"

        controllerArray.append(tab1)
        controllerArray.append(tab2)
        controllerArray.append(tab3)
        controllerArray.append(tab4)
        controllerArray.append(tab5)

        let parameters: [CAPSPageMenuOption] = [
            .centerMenuItems(true),
            .scrollMenuBackgroundColor(UIColor.orange),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor.white),
            .unselectedMenuItemLabelColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.4)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 25.0)!),
            .menuHeight(44.0),
            .menuMargin(20.0),
            .selectionIndicatorHeight(0.0),
            .bottomMenuHairlineColor(UIColor.orange),
            .menuItemWidthBasedOnTitleTextWidth(true),
            .selectedMenuItemLabelColor(UIColor.white)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect.init(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.delegate = self
    }

    
    func willMoveToPage(controller: UIViewController, index: Int){
   
    }
    
    func didMoveToPage(controller: UIViewController, index: Int){
    
    }
}

extension Exam10 : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}

