//
//  TitleView.swift
//  ETV
//
//  Created by Heisenbean on 16/10/12.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit

class TitleView: UIScrollView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var line = UIView().then {
        $0.backgroundColor = UIColor.themeColorGreen()
        $0.height = 2
        $0.x = 7
        $0.y = 33
        $0.width = 80
    }

    
   open var titles = [String](){
        didSet{
            for idx in 0...titles.count-1{
                let _ = UIButton().then {
                    $0.setTitleColor(UIColor.black, for: .normal)
                    $0.setTitleColor(UIColor.themeColorGreen(), for: .selected)
                    $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
                    $0.setTitle(titles[idx], for:.normal)
                    $0.sizeToFit()
                    $0.x = CGFloat(idx * 10) + 80 * CGFloat(idx) + 20
                    $0.y = 20 - 13
                    $0.tag = idx+2000
                    addSubview($0)
                    $0.addTarget(self, action: #selector(btnClicked(button:)), for: .touchUpInside)
                }
            }

        }
    }
    
    func btnClicked(button: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.line.center.x = button.center.x
        }
        button.isSelected = !button.isSelected
        for btn in self.subviews {
            if btn.isKind(of: UIButton.self) {
                let btn  = btn as! UIButton
                btn.isSelected = btn.tag == button.tag
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        backgroundColor = UIColor.white
        addSubview(line)
    }
}
