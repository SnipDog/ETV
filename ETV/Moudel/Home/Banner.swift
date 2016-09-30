//
//  Banner.swift
//  ETV
//
//  Created by Heisenbean on 16/9/30.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit

class Banner: NSObject {
    var title : String?
    
    var smallimg : String?
    
    var bigimg : String?
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    class func banners(dictArray: [[String: AnyObject]]) -> [Banner]? {
        
        if dictArray.count == 0{
            return nil
        }
        
        var banners = [Banner]()
        
        for d in dictArray {
            banners.append(Banner(dict: d))
        }
        return banners
    }

}
