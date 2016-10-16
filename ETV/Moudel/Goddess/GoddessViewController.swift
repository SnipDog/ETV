//
//  GoddessViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import WebKit
class GoddessViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }

    
    func loadData() {
        let request = URLRequest(url: URL(string:"http://m.panda.tv/activity/godvoteios.html")!)
        webView.load(request)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension GoddessViewController:UIWebViewDelegate{
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.Indicator.stopAnimating()
        webView.isHidden = false
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        // show errro msg
    }
}

