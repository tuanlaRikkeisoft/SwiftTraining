//
//  Exam3Tab2.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam3Tab2: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: setup Ui with visualFormat in NSLayoutConstraint
    func setupUI(){
        topView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["topView": topView,
                     "label": label,
                     "rightView": rightView,
                     "bottomView": bottomView]
        
        let leftRightTopViewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[topView]|", options: [], metrics: nil, views: views)
        let topHeightViewTopViewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[topView(180)]-30-[rightView(90)]", options: [], metrics: nil, views: views)
        let rightViewAndLabelConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[label]-10-[rightView(90)]-20-|", options: [], metrics: nil, views: views)
        let bottomVerticalViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomView(100)]-50-|", options: [], metrics: nil, views: views)
        let withOfBottomViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:[bottomView(100)]", options:[], metrics: nil, views: views)
        
        let horizontalBottomViewConstraint = NSLayoutConstraint(item: bottomView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let topLabelViewConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: rightView, attribute: .top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate(leftRightTopViewConstraints)
        NSLayoutConstraint.activate(topHeightViewTopViewConstraints)
        NSLayoutConstraint.activate(rightViewAndLabelConstraint)
        NSLayoutConstraint.activate(bottomVerticalViewConstraint)
        NSLayoutConstraint.activate(withOfBottomViewConstraint)
        NSLayoutConstraint.activate([horizontalBottomViewConstraint])
        NSLayoutConstraint.activate([topLabelViewConstraint])
    }
}
