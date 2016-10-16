//
//  HomeViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Alamofire
import Then
class HomeViewController: UIViewController {
    
    // MARK: Init Properties
    var titleView = TitleView().then {
        $0.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    let kBannerReqeutUrl = "http://api.m.panda.tv/ajax_rmd_ads_get?__version=1.1.4.1261&__plat=ios&__channel=appstore&pt_sign=ef767d23f0a6ccd476b738c0b91c4109&pt_time=1475204481"
    
    
    let kDataReqeutUrl = "http://api.m.panda.tv/ajax_get_live_list_by_multicate?pagenum=4&hotroom=1&__version=1.1.4.1261&__plat=ios&__channel=appstore&pt_sign=ef767d23f0a6ccd476b738c0b91c4109&pt_time=1475204481"

    var banners = [[String:AnyObject]]()
    
    var datas = [[String : AnyObject]]()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
            configUI()
            loadBanner()
            loadData()
            loadTitleView()
        // Do any additional setup after loading the view.
    }

    
    func configUI(){
        self.title = nil
        self.navigationController?.tabBarItem.title = "首页"
        let navView = UIImageView().then {
            let img = UIImage(named: "slogon")
            $0.image = img
            $0.sizeToFit()
        }
        
        self.navigationItem.titleView = navView
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
    
    
    func loadTitleView() {
        view.addSubview(titleView)
        // load data from service
        titleView.titles = ["精彩推荐","全部直播","DOTA2"]
    }

    func loadData() {
        Alamofire.request(kDataReqeutUrl).responseJSON { response in
            if let json = response.result.value {
                let jsonData = json as! [String:AnyObject]
                for data in jsonData["data"] as! [[String : AnyObject]]{
                    self.datas.append(data)
                }
                self.tableview.reloadData()
            }
        }
    }
    
    // MARK: Actions
    @IBAction func search(_ sender: UIBarButtonItem) {
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        cell.data = datas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 321
    }
}
