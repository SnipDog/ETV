//
//  HomeViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    let kBannerReqeutUrl = "http://api.m.panda.tv/ajax_rmd_ads_get?__version=1.1.4.1261&__plat=ios&__channel=appstore&pt_sign=ef767d23f0a6ccd476b738c0b91c4109&pt_time=1475204481"
    
    
    let kDataReqeutUrl = "http://api.m.panda.tv/ajax_get_live_list_by_multicate?pagenum=4&hotroom=1&__version=1.1.4.1261&__plat=ios&__channel=appstore&pt_sign=ef767d23f0a6ccd476b738c0b91c4109&pt_time=1475204481"

    var banners = [[String:AnyObject]]()
    
    var datas = [[String : AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            loadBanner()
            loadData()
        // Do any additional setup after loading the view.
    }

    
    func loadBanner() {
        let banner = tableview.dequeueReusableCell(withIdentifier: "header") as! HomeHeaderCell
        tableview.tableHeaderView = banner
        Alamofire.request(kBannerReqeutUrl).responseJSON { response in
            if let json = response.result.value {
                self.banners.removeAll()
                let jsonData = json as! [String:AnyObject]
                    for data in jsonData["data"] as! [[String : AnyObject]]{
                        self.banners.append(data)
                }
                banner.banners = self.banners
            }
        }
    }
    

    func loadData() {
        Alamofire.request(kDataReqeutUrl).responseJSON { response in
            if let json = response.result.value {
                let jsonData = json as! [String:AnyObject]
                for data in jsonData["data"] as! [[String : AnyObject]]{
                    self.banners.append(data)
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}



