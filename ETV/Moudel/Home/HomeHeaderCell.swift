//
//  HomeHeaderCell.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import SDCycleScrollView

class HomeHeaderCell: UITableViewCell {

    @IBOutlet weak var bannerView: SDCycleScrollView!
    
    var titls = [String]()
    var images = [URL]()
    var banners = [[String : AnyObject]](){
        didSet{
            for data in banners{
                titls.append(data["name"]! as! String)
                images.append(URL.init(string: data["bigimg"]! as! String)!)
            }
            bannerView.imageURLStringsGroup = images
            bannerView.titlesGroup = titls
            bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
