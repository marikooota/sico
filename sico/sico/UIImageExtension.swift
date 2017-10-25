//
//  UIImageExtension.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/10/25.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

extension UIImage{
    
    convenience init(withBackground color: UIColor) {
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size);
        let context:CGContext = UIGraphicsGetCurrentContext()!;
        context.setFillColor(color.cgColor);
        context.fill(rect)
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.init(ciImage: CIImage(image: image)!)
        
    }
}
