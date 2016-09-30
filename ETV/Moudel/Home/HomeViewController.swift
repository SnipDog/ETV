//
//  HomeViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let reqeutUrl = "http://api.m.panda.tv/ajax_rmd_ads_get?__version=1.1.4.1261&__plat=ios&__channel=appstore&pt_sign=ef767d23f0a6ccd476b738c0b91c4109&pt_time=1475204481"
    
    var banners = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            loadBanner()
        // Do any additional setup after loading the view.
    }

    
    func loadBanner() {
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! HomeHeaderCell
        tableView.tableHeaderView = header
        Alamofire.request(reqeutUrl).responseJSON { response in
            if let json = response.result.value {
                let jsonData = json as! [String:AnyObject]
                    for data in jsonData["data"] as! [[String : AnyObject]]{
                        self.banners.append(data)
                }
                header.banners = self.banners;
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
