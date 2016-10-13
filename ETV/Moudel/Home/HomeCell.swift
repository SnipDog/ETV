//
//  HomeCell.swift
//  ETV
//
//  Created by Heisenbean on 16/9/30.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Kingfisher
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

    @IBOutlet weak var personCount1: UIButton!
    @IBOutlet weak var personCount2: UIButton!
    @IBOutlet weak var personCount3: UIButton!
    @IBOutlet weak var personCount4: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var data = [String : AnyObject](){
        didSet{
            let items = data["items"] as! [[String:AnyObject]]
            let item1 = items.first!
            let userinfo1 = item1["userinfo"] as! [String:AnyObject]
            var persons1 = item1["person_num"] as! String
            if Int(persons1)! > 10000 {
               persons1 = String(format: "%.1f万", (Float(persons1)! / 10000.0))
            }
            personCount1.setTitle(persons1, for: .normal)
            title1.text = item1["name"] as? String
            name1.text = userinfo1["nickName"] as? String
            bgIcon1.kf.setImage(with: URL(string: (item1["pictures"]?["img"] as? String)!))
            
            let item2 = items[1]
            let userinfo2 = item2["userinfo"] as! [String:AnyObject]
            var persons2 = item2["person_num"] as! String
            if Int(persons2)! > 10000 {
                persons2 = String(format: "%.1f万", (Float(persons2)! / 10000.0))
            }
            personCount2.setTitle(persons2, for: .normal)
            title2.text = item2["name"] as? String
            name2.text = userinfo2["nickName"] as? String
            bgIcon2.kf.setImage(with: URL(string: (item2["pictures"]?["img"] as? String)!))
            
            let item3 = items[2]
            let userinfo3 = item3["userinfo"] as! [String:AnyObject]
            var persons3 = item3["person_num"] as! String
            if Int(persons3)! > 10000 {
                persons3 = String(format: "%.1f万", (Float(persons3)! / 10000.0))
            }
            personCount3.setTitle(persons1, for: .normal)
            title3.text = item3["name"] as? String
            name3.text = userinfo3["nickName"] as? String
            bgIcon3.kf.setImage(with: URL(string: (item3["pictures"]?["img"] as? String)!))
            
            let item4 = items[3]
            let userinfo4 = item4["userinfo"] as! [String:AnyObject]
            var persons4 = item4["person_num"] as! String
            if Int(persons4)! > 10000 {
                persons4 = String(format: "%.1f万", (Float(persons4)! / 10000.0))
            }
            personCount1.setTitle(persons1, for: .normal)
            title4.text = item4["name"] as? String
            name4.text = userinfo4["nickName"] as? String
            bgIcon4.kf.setImage(with: URL(string: (item4["pictures"]?["img"] as? String)!))
            
            
        }
    }

}
