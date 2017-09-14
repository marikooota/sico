//
//  ViewController.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/09/10.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedLogin(_ sender: Any) {
        
        if (usernameTextField.text?.isEmpty)! {
           
            
        } else {
            //ダイアログ表示
        }
        
        if (passwordTextField.text?.isEmpty)! {
            
        } else {
            //ダイアログ表示
        }
    }

}

