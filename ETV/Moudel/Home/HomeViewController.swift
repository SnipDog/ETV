//
//  HomeViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    let bannerImageArray = [URL.init(string: "https://img1.doubanio.com/view/photo/photo/public/p2379444988.jpg"),
                            URL.init(string: "https://img1.doubanio.com/view/photo/photo/public/p2379444988.jpg"),
                            URL.init(string: "https://img1.doubanio.com/view/photo/photo/public/p2379444988.jpg"),]
    override func viewDidLoad() {
        super.viewDidLoad()
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! HomeHeaderCell
        header.bannerImageArray = bannerImageArray as! [URL];
        tableView.tableHeaderView = header
        
        // Do any additional setup after loading the view.
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
