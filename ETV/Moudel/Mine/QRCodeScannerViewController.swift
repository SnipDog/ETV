//
//  QRCodeScannerViewController.swift
//  ETV
//
//  Created by Heisenbean on 16/11/14.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftQRCode

class QRCodeScannerViewController: UIViewController {
    @IBOutlet weak var lineTopConst: NSLayoutConstraint!

    @IBOutlet weak var qrLine: UIImageView!
    
    let scanner = QRCode(autoRemoveSubLayers: false, lineWidth: 1, strokeColor: UIColor.colorFromRGB(rgbValue: 0x24CD89, alpha: 1.0), maxDetectedCount: 1)
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scanner.prepareScan(view) { (stringValue) -> () in
            print(stringValue)
        }
        scanner.scanFrame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scanner.startScan()
        startAnimation()
        // start scan

    }
    
    
   // MARK: Actions

    func startAnimation(){
            // 初始位置
        lineTopConst.constant = 14
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 2.5){
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.lineTopConst.constant = self.qrLine.width;
            self.view.layoutIfNeeded()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
