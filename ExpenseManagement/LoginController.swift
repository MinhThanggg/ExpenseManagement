//
//  LoginController.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/23/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLogin(_ sender: UIButton) {
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // setting Radius
        txtEmail.clipsToBounds = true
        txtEmail.layer.cornerRadius = 10
        background.clipsToBounds = true
        background.layer.cornerRadius = 10
        txtPassword.clipsToBounds = true
        txtPassword.layer.cornerRadius = 10
        
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
