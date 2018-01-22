//
//  ユーザ個人サイトの画面
//  UserSiteViewController.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/11/02.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class UserSiteViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

//        configurePage()
        
        // 画面の縦横サイズ取得
        let boundsize: CGSize = UIScreen.main.bounds.size
        let boundsWidth: CGFloat = boundsize.width
        let boundsHeight: CGFloat = boundsize.height
        
        let scrollView = UIScrollView()
        scrollView.frame.size = CGSize(width: boundsWidth, height: boundsHeight)
        scrollView.center = self.view.center
        
        // TODO:contentSizeを画面数に合わせる(夢)
        scrollView.contentSize = CGSize(width: boundsWidth * 4, height: boundsHeight)
        // 跳ね返り
        scrollView.bounces = false
        // Delegate を設定
        scrollView.delegate = self
        // ページ単位のスクロール
        scrollView.isPagingEnabled = true
        
        
        // TODO:XibのViewを設定
        let view = UserSiteHomeXibView.instanceFromNib()
        view.frame = CGRect(x: 0, y: 0, width: boundsWidth, height: boundsHeight)
        scrollView.addSubview(view)
        
        self.view.addSubview(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    fileprivate func configurePage() {
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        
//        let middlebutton = UIButton()
//        middlebutton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        middlebutton.imageView?.image = UIImage(named: "header_back")
//        middlebutton.setImage(UIImage(named: "header_back"), for: UIControlState.normal)
//        middlebutton.contentMode = .scaleAspectFit
//        self.navigationController?.navigationItem.titleView = middlebutton
//    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
