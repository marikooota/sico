//
//  HomeListPageItem.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/09/14.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class HomeListPageItem: UIViewController {

    @IBOutlet weak var loginButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Noto Sans Mono CJK JP", size: 17)!], for: UIControlState.normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
