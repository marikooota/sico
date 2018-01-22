//
//  ContainerPageViewController.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/11/01.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class ContainerPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    func getFirst() -> HashTagTableViewController {
        return storyboard!.instantiateViewController(withIdentifier: "HashTagTableViewController") as!HashTagTableViewController
    }
    func getSecond() -> PeopleTableViewController {
        return storyboard!.instantiateViewController(withIdentifier: "PeopleTableViewController") as! PeopleTableViewController
    }
    func getThird() -> SpotTableViewController{
        return storyboard!.instantiateViewController(withIdentifier: "SpotTableViewController") as!SpotTableViewController
    }
    
}

extension ContainerPageViewController : UIPageViewControllerDataSource {
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: SpotTableViewController.self) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: PeopleTableViewController.self) {
            // 2 -> 1
            return getFirst()
        }else{
            // 1 -> end of the road
            return nil
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: HashTagTableViewController.self) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKind(of: PeopleTableViewController.self) {
            // 2 -> 3
            return getThird()
        }else{
            // 3 -> end of the road
            return nil
        }
    }
}
