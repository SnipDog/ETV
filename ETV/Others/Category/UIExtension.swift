//
//  UIExtension.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
extension UIView {
    
    var x : CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newX) {
            self.frame.origin.x = newX
        }
    }
    
    var y : CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newY) {
            self.frame.origin.y = newY
        }
    }
    
    var width : CGFloat {
        get {
            return self.frame.size.width
        }
        set(newWidth) {
            self.frame.size.width = newWidth
        }
    }
    
    var height : CGFloat {
        get {
            return self.frame.size.height
        }
        set(newHeight) {
            self.frame.size.height = newHeight
        }
    }
    
    // CGColor
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension CGRect {
    var x : CGFloat {
        get {
            return self.origin.x
        }
        set(newX) {
            self.origin.x = newX
        }
    }
    
    var y : CGFloat {
        get {
            return self.origin.y
        }
        set(newY) {
            self.origin.y = newY
        }
    }
    
    var width : CGFloat {
        get {
            return self.size.width
        }
        set(newWidth) {
            self.size.width = newWidth
        }
    }
    
    var height : CGFloat {
        get {
            return self.size.height
        }
        set(newHeight) {
            self.size.height = newHeight
        }
    }
    
    
}

extension UIColor {
    
    
    class func colorFromRGB(_ rgbValue: Int, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: alpha)
    }
    
    class func randomColor() -> UIColor {
        
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255, green: CGFloat(arc4random_uniform(256)) / 255, blue: CGFloat(arc4random_uniform(256)) / 255, alpha: 1.0)
    }
    
    class func themeColorGreen() ->UIColor{
        return UIColor.init(colorLiteralRed: 36/255.0, green: 205/255.0, blue: 137/255.0, alpha: 1.0)
    }
    
}

extension UIBarButtonItem {
    
    class func itemWith(_ bg: String, highBg: String, target: AnyObject, imageInset: UIEdgeInsets, action: Selector) -> UIBarButtonItem {
        
        let button = UIButton()
        
        button.setImage(UIImage(named: bg), for: UIControlState.normal)
        button.setImage(UIImage(named: highBg), for: UIControlState.highlighted)
        button.imageEdgeInsets = imageInset
        button.sizeToFit()
        button.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        return UIBarButtonItem(customView: button)
    }
    
    class func itemWithButton(_ bg: String, highBg: String, imageInset: UIEdgeInsets) -> UIBarButtonItem {
        
        let button = UIButton()
        
        button.setImage(UIImage(named: bg), for: UIControlState.normal)
        button.setImage(UIImage(named: highBg), for: UIControlState.highlighted)
        button.imageEdgeInsets = imageInset
        button.sizeToFit()
        
        return UIBarButtonItem(customView: button)
    }
    
    
    
}


extension UIStoryboard {
    
    class func initialViewController(_ name: String) -> UIViewController {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateInitialViewController()!
    }
}

extension UIScreen {
    
    class func isInch3_5() -> Bool {
        
        
        return UIScreen.main.bounds.height == 480 ? true : false
    }
    
    class func isInch4_0() -> Bool {
        
        
        return UIScreen.main.bounds.height == 568 ? true : false
    }
    
    class func isInch4_7() -> Bool {
        
        
        return UIScreen.main.bounds.height == 667 ? true : false
    }
    
    class func isInch5_5() -> Bool {
        
        
        return UIScreen.main.bounds.height == 736 ? true : false
    }
}
