//
//  MineViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/11/13.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(-26, 0, 0, 0)
        navigationItem.rightBarButtonItem = UIBarButtonItem.itemWith("mine_settingIcon2", highBg: "mine_settingIcon2_press", target: self, imageInset: .zero, action: #selector(setting))
    
    }

    func setting() {
        let setttingVc = UIStoryboard.initialViewController("Setting")
        navigationController?.pushViewController(setttingVc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0{
            let login = UIStoryboard.initialViewController("Login")
            navigationController?.pushViewController(login, animated: true)
        }
    }
}
