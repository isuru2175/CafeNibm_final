//
//  ForgotViewController.swift
//  CafeNibm
//
//  Created by isuru on 3/6/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotViewController: UIViewController {
 @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func onForgot(_ sender: UIButton) {
        let emailText=email.text!;
        Auth.auth().sendPasswordReset(withEmail: emailText) { error in
            // Your code here
        }
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
