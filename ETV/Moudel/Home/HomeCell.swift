//
//  HomeCell.swift
//  ETV
//
//  Created by Heisenbean on 16/9/30.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON
class HomeCell: UITableViewCell {

    @IBOutlet weak var titleIcon: UIImageView!

    @IBOutlet weak var headerTitle: UILabel!

    
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

    @IBOutlet weak var personCount1: UIButton!
    @IBOutlet weak var personCount2: UIButton!
    @IBOutlet weak var personCount3: UIButton!
    @IBOutlet weak var personCount4: UIButton!
    
    @IBOutlet weak var more: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var data: JSON!{
        didSet{
            
            titleIcon.kf.setImage(with: URL(string: data["type"]["icon"].stringValue))
            headerTitle.text = data["type"]["cname"].string
            more.isHidden = data["type"]["cname"] == "热门" || data["type"]["cname"] == "猜你喜欢"
            
            let items = data["items"].arrayValue
         
            
            let item1 = items.first!
            var persons1 = item1["person_num"].stringValue
            if Int(persons1)! > 10000 {
               persons1 = String(format: "%.1f万", (Float(persons1)! / 10000.0))
            }
            personCount1.setTitle(persons1, for: .normal)
            title1.text = item1["name"].string
            name1.text = item1["userinfo"]["nickName"].string
            bgIcon1.kf.setImage(with: URL(string: (item1["pictures"]["img"].stringValue)))

            let item2 = items[1]
            var persons2 = item2["person_num"].stringValue
            if Int(persons2)! > 10000 {
                persons2 = String(format: "%.1f万", (Float(persons2)! / 10000.0))
            }
            personCount2.setTitle(persons2, for: .normal)
            title2.text = item2["name"].string
            name2.text = item2["userinfo"]["nickName"].string
            bgIcon2.kf.setImage(with: URL(string: (item2["pictures"]["img"].stringValue)))
            
            let item3 = items[2]
            var persons3 = item3["person_num"].stringValue
            if Int(persons3)! > 10000 {
                persons3 = String(format: "%.1f万", (Float(persons3)! / 10000.0))
            }
            personCount3.setTitle(persons3, for: .normal)
            title3.text = item3["name"].string
            name3.text = item3["userinfo"]["nickName"].string
            bgIcon3.kf.setImage(with: URL(string: (item3["pictures"]["img"].stringValue)))
            
            let item4 = items[3]
            var persons4 = item4["person_num"].stringValue
            if Int(persons4)! > 10000 {
                persons4 = String(format: "%.1f万", (Float(persons4)! / 10000.0))
            }
            personCount4.setTitle(persons4, for: .normal)
            title4.text = item4["name"].string
            name4.text = item4["userinfo"]["nickName"].string
            bgIcon4.kf.setImage(with: URL(string: (item4["pictures"]["img"].stringValue)))
            
        }
    }

}
