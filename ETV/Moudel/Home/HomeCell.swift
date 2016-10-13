//
//  HomeCell.swift
//  ETV
//
//  Created by Heisenbean on 16/9/30.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var bgIcon1: UIImageView!
    @IBOutlet weak var bgIcon2: UIImageView!
    @IBOutlet weak var bgIcon3: UIImageView!
    @IBOutlet weak var bgIcon4: UIImageView!

    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var title4: UILabel!

    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var name4: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var data = [String : AnyObject](){
        didSet{
            let items = data["items"] as! [[String:AnyObject]]
            let item1 = items.first!
            let userinfo1 = item1["userinfo"] as! [String:AnyObject]
            title1.text = item1["name"] as? String
            name1.text = userinfo1["nickName"] as? String
        }
    }

}
