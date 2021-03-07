//
//  HomeViewController.swift
//  CafeNibm
//
//  Created by isuru on 3/6/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let foodItems = ["BBQ","kottu","rice","submarin"]
    let foodDesc = ["10% discount","Free Coke","Free Garlic Bread","30% discount"]
    let Foodprice = ["350.00", "450.00", "950.00", "280.00"]
    
    
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!

    
     var foods : [Foods] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        let allPlaces = self.ref.child("item")

        allPlaces.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                let discount = placeDict["discount"] as! Int
                let discription = placeDict["discription"] as! String
                let foodName = placeDict["foodName"] as! String
                let id = placeDict["id"] as! Int
                let photoURL = placeDict["photoURL"] as! String
                let price = placeDict["price"] as! Float
                
                let food = CafeNibm.Foods(Name:foodName,discription: discription,price: price,discount: discount,id: id,photourl: photoURL)
                                   
                                   self.foods.append(food)
               
            }
            self.tableView.reloadData()
//            print(self.foods[0].id)
        })
//        ref = Database.database().reference()
//        ref.child("item").observe(.value, with: { (snapshot) in
//            if let directory =snapshot.value as? [String:Any]{}
//        }, withCancel: T##((Error) -> Void)?##((Error) -> Void)?##(Error) -> Void)
//        ref.observe(.value) { snapshot in
//        for child in snapshot.children {
//            let data=child.
//                           let name = dd["Name"] as! String
//                            let discrip = dd["description"] as! String
//                            let price = dd["price"] as! Float
//                            let discount = dd["discount"] as! Int
//                            let foodId = dd["id"] as! String
//
//
//
//
//
//                            let foodget = nibm_cafe.food(Name:name,discription: discrip,price: price,discount: discount,id: foodId)
//
//                            self.food.append(foodget)
//        }
//        }
//        let food = CafeNibm.Foods()

        // Do any additional setup after loading the view.
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return self.foods.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! ProductsTableViewCell
        

        cell.lblFoodName.text = self.foods[indexPath.row].foodName
          let storage = Storage.storage()
          let storageRef = storage.reference()
          
          let path = self.foods[indexPath.row].photoURL
          
         
          let formattedString = path.replacingOccurrences(of: " ", with: "")
          let islandRef = storageRef.child(formattedString)
          
          islandRef.getData(maxSize: 1 * 250 * 250) { data, error in
              if error != nil {
             print("error")
            } else {
              // Data for "images/island.jpg" is returned
              let image = UIImage(data: data!)
              cell.FoodItemImage.image = image
              
              
            }
          }
//        cell.FoodItemImage.image = UIImage(named: foodItems[2])

        cell.lblFoofDescription.text = self.foods[indexPath.row].discription
        cell.lblPrice.text = ( "Rs." + String(self.foods[indexPath.row].price))

        return cell
        
       
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let next = (storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController)!
              
              self.navigationController?.pushViewController(next, animated: true)
        let foo = self.foods[indexPath.row]
              next.name = foo.foodName
              next.productprice = String( foo.price )
              next.discrip = foods[indexPath.row].discription
              next.foodurl = foods[indexPath.row].photoURL
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
