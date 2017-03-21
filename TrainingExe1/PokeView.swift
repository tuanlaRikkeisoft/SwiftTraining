//
//  PokeView.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class PokeView: UIView {

    @IBOutlet weak var pokeImageView: UIImageView!
    
    @IBOutlet weak var tap: UITapGestureRecognizer!
    @IBOutlet weak var swipe: UISwipeGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func actionTapPoke(_ sender: Any) {
        self.tapPoke(){
            ()->() in
        }
    }
    @IBAction func actionSwipePoke(_ sender: Any) {
        self.swipePoke(){
            ()->() in
        }
    }
    
    public func tapPoke(completion: ()-> ()){
        completion()
    }
    
    public func swipePoke(completion: ()-> ()){
        completion()
    }
    
}
