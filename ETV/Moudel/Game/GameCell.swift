//
//  GameCell.swift
//  ETV
//
//  Created by Heisenbean on 16/10/15.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Kingfisher
class GameCell: UICollectionViewCell {
    
    @IBOutlet weak var bgIcon: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    var model = [String : AnyObject](){
        didSet{
           gameTitle.text = model["cname"] as? String
            bgIcon.kf.setImage(with: URL(string: model["img"] as! String))
        }
    }
}
