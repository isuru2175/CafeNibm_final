//
//  ProductsTableViewCell.swift
//  CafeNibm
//
//  Created by isuru on 3/6/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var FoodItemImage: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoofDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
