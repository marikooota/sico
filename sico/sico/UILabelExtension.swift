//
//  LabelDesign.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/10/21.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

extension UILabel{
    
}
@IBDesignable class LabelPadding: UILabel {

    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    
    override func drawText(in rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, padding)
        super.drawText(in: newRect)
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
}
