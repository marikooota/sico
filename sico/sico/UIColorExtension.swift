//
//  UIColorExtension.swift
//  sico
//
//  Created by 太田麻莉子 on 2018/01/21.
//  Copyright © 2018年 太田麻莉子. All rights reserved.
//

import UIKit

extension UIColor {
    class func rgb(_ r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
