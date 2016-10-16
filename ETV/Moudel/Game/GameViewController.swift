//
//  GameViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import Alamofire
class GameViewController: UIViewController {

    // MARK:Init Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    var models = [[String : AnyObject]]()
    let kRequestUrl = "http://api.m.panda.tv/index.php?method=category.list&type=game&__version=2.0.1.1339&__plat=ios&__channel=appstore&pt_sign=f8802801e9daf1d0f0e09027aac27c6a&pt_time=1476504216"
    let margin = CGFloat(5)
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configLayout()
        // Do any additional setup after loading the view.
    }

    func configLayout() {
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - margin * 4) / 3, height: 202)
        collectionView.contentInset = UIEdgeInsetsMake(5, 4, 4, 4)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
    }
    
    
    func loadData() {
        Alamofire.request(kRequestUrl).responseJSON { response in
            if let json = response.result.value {
                let jsonData = json as! [String:AnyObject]
                for data in jsonData["data"] as! [[String : AnyObject]]{
                    self.models.append(data)
                }
                    self.collectionView.reloadData()
            }
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}




extension GameViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCell
        cell.model = models[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }
    
}
