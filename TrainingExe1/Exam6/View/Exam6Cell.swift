//
//  Exam6Cell.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class Exam6Cell: UICollectionViewCell {
    let pokeBackTag: Int = 0
    let pokeFrontTag: Int = 1
    var pokeViews : (frontView: UIImageView, backView: UIImageView)?
    var imageViewBack: UIImageView!
    var imageViewFront: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewBack = self.createPokeViewWithImage(imageName: "poke.png", tag: self.pokeBackTag)
        imageViewFront = self.createPokeViewWithImage(imageName: "poke3.png", tag: self.pokeFrontTag)
        pokeViews = (frontView: imageViewFront,backView:imageViewBack)
        contentView.addSubview(imageViewBack)
        
        let swipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(flipPokeAnimation))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.left
        self.addGestureRecognizer(swipeGesture)
    }

    private func createPokeViewWithImage(imageName: String, tag: Int) ->UIImageView{
        let newPokeImageView = UIImageView(frame: self.frame)
        newPokeImageView.image = UIImage(named: imageName)
        newPokeImageView.tag = tag
        return newPokeImageView
    }
    
    // MARK: Flip Animation Setup
    
    func flipPokeAnimation(){
        if (imageViewBack.superview != nil) {
            pokeViews = (frontView: imageViewFront,backView:imageViewBack)
        }else{
            pokeViews = (frontView: imageViewBack,backView:imageViewFront)
        }
        let transitionOptions = UIViewAnimationOptions.transitionFlipFromLeft
        UIView.transition(with: self.contentView, duration: 0.5, options: transitionOptions, animations: { 
            self.pokeViews!.backView.removeFromSuperview()
            self.contentView.addSubview(self.pokeViews!.frontView)
        }, completion: nil)
    }
}
