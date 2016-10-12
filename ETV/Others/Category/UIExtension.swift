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
    
    
    class func colorFromRGB(rgbValue: Int, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: alpha)
    }
    
    class func randomColor() -> UIColor {
        
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255, green: CGFloat(arc4random_uniform(256)) / 255, blue: CGFloat(arc4random_uniform(256)) / 255, alpha: 1.0)
    }
    
    class func themeColorGreen() ->UIColor{
        return UIColor.init(colorLiteralRed: 36/255.0, green: 205/255.0, blue: 137/255.0, alpha: 1.0)
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
