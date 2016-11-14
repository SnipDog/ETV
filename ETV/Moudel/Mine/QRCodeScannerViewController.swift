//
//  QRCodeScannerViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/11/14.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import SwiftQRCode

class QRCodeScannerViewController: UIViewController {

    let scanner = QRCode(autoRemoveSubLayers: false, lineWidth: 1, strokeColor: UIColor.colorFromRGB(rgbValue: 0x24CD89, alpha: 1.0), maxDetectedCount: 1)
    
    override func viewDidLoad() {
        
        configUI()
        
        super.viewDidLoad()
        
    }
    
    func configUI() {
        
        view.backgroundColor = UIColor.black
        
        
        scanner.prepareScan(view) { (stringValue) -> () in
            print(stringValue)
        }
        scanner.scanFrame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // start scan
        scanner.startScan()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
