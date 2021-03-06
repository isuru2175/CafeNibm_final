//
//  ViewController.swift
//  CafeNibm
//
//  Created by isuru on 3/5/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    let auth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onLogin(_ sender: UIButton) {
//        auth.signIn(withEmail: email.text!,password: password.text!, completion: {result,err in
//            //result.
//            if err == nil{
//                 self.performSegue(withIdentifier: "Home", sender: self)
//            }
//            var message:String,title:String
//
//            switch AuthErrorCode(rawValue: err!._code){
//            case .networkError:
//                title="Network Error"
//                message="check your Connection"
//
//            default:
//                title="Somthing Wrong"
//                message="check your Connection"
//
//
//            }
//            var  alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            self.present(alert, animated: true)
//        })
       if let email = email.text, let password = password.text
       {
           Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
             
               if let errr=error
               {
                   print(errr)
               }
               else
               {
                   self.performSegue(withIdentifier: "Home", sender: self)
               }
           }
       }
    }
    
    
    @IBAction func Register(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Register", sender: self)
    }
    
    
    @IBAction func onForgot(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FogotMyPassword", sender: self)
    }
    
}

