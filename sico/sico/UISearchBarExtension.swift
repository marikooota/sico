//
//  UISearchBarExtension.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/10/27.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar{
    
}

@IBDesignable class TextFieldCustomize: UISearchBar {
    
    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    
    
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
    
}
