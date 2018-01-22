//
//  UserSiteHomeXibView.swift
//  sico
//
//  Created by 太田麻莉子 on 2017/11/20.
//  Copyright © 2017年 太田麻莉子. All rights reserved.
//

import UIKit

class UserSiteHomeXibView: UIView, UIScrollViewDelegate {
    
    @IBOutlet weak var menu1: UILabel!
    @IBOutlet weak var menu2: UILabel!
    @IBOutlet weak var menu3: UILabel!
    @IBOutlet weak var menu4: UILabel!
    @IBOutlet weak var title: UILabel!
    
    // 画面サイズ情報
    fileprivate let boundsWidth: CGFloat = UIScreen.main.bounds.size.width
    fileprivate let boundsHeight: CGFloat = UIScreen.main.bounds.size.height
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "UserSiteHomeView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutIfNeeded()
        
        setMenu()
        setTitle()
        setFirstPage()
    }
    
    /// トップメニューを設定
    fileprivate func setMenu() {
        
        // TODO: DBから選択しているメニューのタイプを取得
        // TODO: メニューマスタからメニュー名をセット(以下仮)
        menu1.text = "HOME"
        menu2.text = "NEWS"
        menu3.text = "GALLERY"
        menu4.text = "PROFILE"
        
        // 選択中の色に設定
        menu1.textColor = Colors.ConstColor().menuSelected()
        
        let menus = [menu1, menu2, menu3, menu4]
        menuConfiguration(menus: menus as! [UILabel])
    }
    
    fileprivate func menuConfiguration(menus: [UILabel]) {
        var charactersWidth: CGFloat = 0
        for menu in menus {
            menu.translatesAutoresizingMaskIntoConstraints = true
            menu.sizeToFit()
            charactersWidth = charactersWidth + menu.frame.width
        }
        
        let labelsEachSpace = (boundsWidth - charactersWidth) / CGFloat(menus.count + 1)
        var menuX = labelsEachSpace
        for menu in menus {
            menu.frame = CGRect(x: menuX, y: menu.frame.origin.y, width: menu.frame.width, height: menu.frame.height)
            menuX += labelsEachSpace + menu.frame.width
        }
    }
    
    /// タイトルを設定
    fileprivate func setTitle() {
        let space : CGFloat = 30
        let heightFromMenu :CGFloat = menu1.frame.origin.y + menu1.frame.height + space
        // TODO: DBからブランド名取得
        title.text = "UNFLL™"
        // 中身のテキストにUILabelの幅と高さを合わせる
        title.sizeToFit()
        // 配置する x: (画面の幅 - title.width) /2   y: topspace + メニューの高さ + メニューからの余白
        let titleWidth :CGFloat = title.frame.width
        let titleHeight :CGFloat = title.frame.height
        title.frame = CGRect(x: (boundsWidth - title.frame.width) / 2, y: heightFromMenu, width: titleWidth, height: titleHeight)
    }
    
    /// 1ページ目を設定
    fileprivate func setFirstPage() {
        
        let imageView1 = UIImageView()
        let imageView2 = UIImageView()
        let imageView3 = UIImageView()
        let imageView4 = UIImageView()
        // TODO: DBから取得
        imageView1.image = UIImage(named: "sample1")
        imageView2.image = UIImage(named: "sample2")
        imageView3.image = UIImage(named: "sample4")
        imageView4.image = UIImage(named: "sample3")
        imageView1.tag = 1
        imageView2.tag = 2
        imageView3.tag = 3
        imageView4.tag = 4
        
        let imageViews = [imageView1, imageView2, imageView3, imageView4]
        
        let innerView: UIView = firstpageConfiguration(imageViews: imageViews)
        self.addSubview(innerView)
    }
    
    fileprivate func firstpageConfiguration(imageViews: [UIImageView]) -> UIView {
        
        // このViewにImageViewをaddしていく
        let innerView : UIView = UIView()
        innerView.frame = CGRect(x: 0, y: 0, width: boundsWidth, height: boundsHeight)
        
        let sideSpace : CGFloat = 15
        let bottomSpace : CGFloat = 50
        let middleHalfSpace : CGFloat = 5
        let space : CGFloat = 20
        
        for imageView in imageViews {
            let heightFromTitle = title.frame.height + title.frame.origin.y + space
            let imageOriginWidth : CGFloat = (imageView.image?.size.width)!
            let imageOriginHeight : CGFloat = (imageView.image?.size.height)!
            
            // 仮の枠の横幅を求める(横幅ー10*2 - 5*2）/2
            let tempFrameWidth : CGFloat = (boundsWidth - sideSpace * 2 - middleHalfSpace * 2) / 2
            // 仮の枠の縦幅も同じく
            let tempFrameHeight : CGFloat = (boundsHeight - (heightFromTitle + bottomSpace) - middleHalfSpace * 2) / 2
            
            
            // 元の画像の横幅と仮の枠の横幅の縮尺を求める（枠/画像）
            let widthScale : CGFloat = tempFrameWidth / imageOriginWidth
            
            // 元の画像のたて幅と仮の枠のたて幅の縮尺を求める（枠/画像）
            let heightScale : CGFloat = tempFrameHeight / imageOriginHeight
            
            // 縦と横の縮尺を比べて小さい方の縮尺に合わせる
            var imagewidth : CGFloat
            var imageheight : CGFloat
            if widthScale <= heightScale {
                imagewidth = imageOriginWidth * widthScale
                imageheight = imageOriginHeight * widthScale
            } else {
                imagewidth = imageOriginWidth * heightScale
                imageheight = imageOriginHeight * heightScale
            }
            
            // y軸をずらすためのタイトルまでの高さ - 上下余白の高さ / 2 の差分
            let yDiff = heightFromTitle - (heightFromTitle + bottomSpace) / 2
            
            var imageX : CGFloat? = nil
            var imageY : CGFloat? = nil
            switch imageView.tag {
            case 1:
                // 画面の幅の半分ー画像の幅-5（左上の画像のx軸)
                imageX = (boundsWidth / 2) - (imagewidth + middleHalfSpace)
                
                // 画面の縦幅の半分ー画像の高さ-5(画像の下の余白)（左上の画像のy軸) + 上の余白
                imageY = (boundsHeight / 2) - (imageheight + middleHalfSpace) + yDiff
                break
            case 2:
                // 右側の画像のx軸は画面の幅の半分+5
                imageX = (boundsWidth / 2) + middleHalfSpace
                // y軸は画面の高さ/2 + 5 + 画像の高さ + 上の余白
                imageY = (boundsHeight / 2) - (imageheight + middleHalfSpace) + yDiff
                break
            case 3:
                // 右側の画像のx軸は画面の幅の半分+5
                imageX = (boundsWidth / 2) - (imagewidth + middleHalfSpace)
                // y軸は画面の高さ/2 + 5 + 画像の高さ + 上の余白
                imageY = (boundsHeight / 2) + middleHalfSpace + yDiff
                break
            case 4:
                // 右側の画像のx軸は画面の幅の半分+5
                imageX = (boundsWidth / 2) + middleHalfSpace
                // y軸は画面の高さ/2 + 5 + 画像の高さ + 上の余白
                imageY = (boundsHeight / 2) + middleHalfSpace + yDiff
                break
            default:
                if imageX == nil || imageY == nil {
                    // TODO: error
                }
                break
            }
            
            imageView.frame = CGRect(x: imageX!, y: imageY!, width: imagewidth, height: imageheight)
            imageView.contentMode = .scaleAspectFit
            
            innerView.addSubview(imageView)
        }
        return innerView
    }
}
