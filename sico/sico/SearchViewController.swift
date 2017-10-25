//
//  SearchViewController.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/10/21.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchKindTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let hashtag: UITabBarItem = searchKindTabBar.viewWithTag(0)
//        for item in searchKindTabBar.items!{
//            switch item.tag {
//            case 0:
//                item.imageInsets = UIEdgeInsetsMake(40, 0, -40, 0)
//                
//                break
//            case 1:
//                item.imageInsets = UIEdgeInsetsMake(30, 0, -30, 0)
//                break
//            case 2:
//                item.imageInsets = UIEdgeInsetsMake(25, 0, -25, 0)
//                break
//            default:
//                break
//            }
//        }
        
        navigationController?.navigationBar
        let navigationHeaderColor = self.navigationController?.navigationBar.backgroundColor
        searchBar.backgroundColor = navigationHeaderColor
        searchKindTabBar.tintColor = UIColor.black
        searchKindTabBar.barTintColor = UIColor.init(white: 1, alpha: 0)
//        searchKindTabBar.backgroundImage
        searchKindTabBar.backgroundImage = UIImage(withBackground: UIColor.clear)
        
        searchKindTabBar.shadowImage = UIImage()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
