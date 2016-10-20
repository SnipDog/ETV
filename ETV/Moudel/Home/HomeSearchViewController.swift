//
//  HomeSearchViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/10/20.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit

class HomeSearchViewController: UIViewController {

    let searchTextField = UITextField().then{
        $0.frame = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width - 80, height: 30)
        $0.backgroundColor = UIColor.colorFromRGB(rgbValue: 0xededed, alpha: 1.0)
        $0.placeholder = "搜索房间ID,主播名称"
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configUI(){
        self.navigationItem.titleView = searchTextField
        searchTextField.addTarget(self, action: #selector(textFieldDidChanged(textField:)), for: .editingChanged)
    }

    func textFieldDidChanged(textField:UITextField) {
        print(textField.text)
    }

}
