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
    
    var bannerImageArray = [URL](){
        didSet{
            self.bannerView.imageURLStringsGroup = bannerImageArray
            self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
            self.bannerView.titlesGroup = ["第一个banner","第二个banner","第三个banner"]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
