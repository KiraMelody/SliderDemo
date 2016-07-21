//
//  Mycircle.swift
//  Circle
//
//  Created by TJQ on 16/7/21.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

class Mycircle: UIViewController {
    private var myContext = 0
    var circle: UIView!
    var slider = UISlider()
    var label = UILabel()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        slider.setValue(0.5, animated: true)
        slider.userInteractionEnabled = true
        slider.continuous = true
        slider.thumbTintColor = UIColor.blueColor()
        label.text = "\(slider.value * 100)"
        circle = UIView()
        circle.layer.cornerRadius = 50
        circle.backgroundColor = UIColor.blueColor()
        view.addSubview(circle)
        view.addSubview(label)
        view.addSubview(slider)
        circle.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        label.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(circle.snp_bottom).offset(10)
        }
        slider.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.bottom.lessThanOrEqualTo(view)
            make.top.greaterThanOrEqualTo(label.snp_bottom)
            make.width.equalTo(view).multipliedBy(0.8)
        }
        
        slider.addTarget(self, action:"sliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func sliderValueChanged(sender: UISlider) {
        label.text = "\(slider.value * 100)"
        let r = CGFloat(slider.value * 100)
        let radius = CGFloat(slider.value * 50)
        circle.snp_updateConstraints { (make) -> Void in
            make.width.equalTo(r)
            make.height.equalTo(r)
        }
        circle.layer.cornerRadius = radius
    }
    
    
}
