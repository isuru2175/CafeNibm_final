//
//  RegisterViewController.swift
//  CafeNibm
//
//  Created by isuru on 3/6/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    let auth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        if let email = email.text, let password = password.text{
        
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let errr=error
            {
                print(errr)
            }
            else
            {
                 let ref = Database.database().reference()
                ref.childByAutoId().setValue(["phoneNumber": "5545458545","email":email])
         
//                let user = self.auth.currentUser
//                var  alert = UIAlertController(title: "user", message: user?.uid, preferredStyle: .alert)
//                          self.present(alert, animated: true)

                
                self.performSegue(withIdentifier: "Home", sender: self)
            }
          
            }
        }
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
         self.performSegue(withIdentifier: "Login", sender: self)
    }
    /*
     @IBAction func onRegister(_ sender: UIButton) {
     }
     // MARK: - Navigation

     @IBAction func onRegister(_ sender: UIButton) {
     }
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
