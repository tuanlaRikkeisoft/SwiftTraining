//
//  AVResultModel.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/21/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit

class AVResultModel: NSObject {
    
    var captureDate = Date()
    var avValue = Float()
    var loviValue = Int()
    
    public init(_ captureDate: Date, _ avValue: Float, _ loviValue: Int ) {
        self.captureDate = captureDate 
        self.avValue = avValue
        self.loviValue = loviValue
    }
}
