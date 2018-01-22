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
        
        let searchTextField: UITextField = (searchBar.value(forKey: "searchField") as? UITextField)!
        searchTextField.layer.cornerRadius = 100
        searchBar.clipsToBounds = true
        
        //TabBar選択時の色を黒に
        searchKindTabBar.tintColor = UIColor.black
        searchKindTabBar.barTintColor = UIColor.init(white: 1, alpha: 0)
        
        //TabBar背景を透過
        searchKindTabBar.backgroundImage = UIImage(withBackground: UIColor.clear)
        searchKindTabBar.shadowImage = UIImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
