//
//  HomeViewController.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/09/14.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for tabItem in tabBar.items! {
            //TabBarItemアイコンの位置を設定
            tabItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
