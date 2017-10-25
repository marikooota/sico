//
//  HomeListPageItem.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/09/14.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class HomeListPageItem: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loginButton: UIBarButtonItem!
    @IBOutlet weak var timelineTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Noto Sans Mono CJK JP", size: 17)!], for: UIControlState.normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //各セルの要素を設定する
    internal func tableView(_ timelineTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timelineTableView.dequeueReusableCell(withIdentifier: "timeLineCell")! as UITableViewCell
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: "timeline_image1")
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        let label = cell.viewWithTag(2) as! UILabel
        label.text = "unfull"
        return cell
    }
    
    //セルに表示する文字列の個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //セルが選択された時に動作する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        return
    }
}
