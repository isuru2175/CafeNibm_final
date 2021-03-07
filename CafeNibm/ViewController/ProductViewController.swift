//
//  ProductViewController.swift
//  CafeNibm
//
//  Created by isuru on 3/7/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ProductViewController: UIViewController {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var priceVew: UILabel!
    @IBOutlet weak var desc: UILabel!
    var name = ""
    var productprice = ""
    var discrip = ""
    var foodurl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        foodName.text = name

             priceVew.text = "RS."+productprice

             desc.text = discrip

        let storage = Storage.storage()
           let storageRef = storage.reference()

           let path = foodurl


           let formattedString = path.replacingOccurrences(of: " ", with: "")
           let islandRef = storageRef.child(formattedString)

           islandRef.getData(maxSize: 1 * 250 * 250) { data, error in
               if error != nil {
              print("error")
             } else {
               // Data for "images/island.jpg" is returned
               let image = UIImage(data: data!)
                self.imageView.image = image


             }
           }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = false    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
