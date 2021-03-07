//
//  Foods.swift
//  CafeNibm
//
//  Created by isuru on 3/6/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import Foundation
class Foods {
    var foodName : String
    var discription : String
    var price : Float
    var discount : Int
    var id : Int
    var photoURL:String
   
    
    init(Name : String,discription : String,price : Float,discount:Int,id:Int,photourl:String) {
        
        self.foodName = Name
        self.discription = discription
        self.price = price
        self.discount = discount
        self.id = id
        self.photoURL=photourl
        
        
    }
}
