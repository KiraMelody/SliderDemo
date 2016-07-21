//
//  ViewController.swift
//  Circle
//
//  Created by TJQ on 16/7/21.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    var circle = UIView()
    var slider = UISlider()
    var label = UILabel()
    var subLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(circle)
        view.addSubview(label)
        view.addSubview(slider)
        slider.setValue(0.5, animated: true)
        slider.userInteractionEnabled = true
        slider.continuous = true
        slider.thumbTintColor = UIColor.blueColor()
        label.text = "\(slider.value * 100)"
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: CGFloat(100 * slider.value), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.purpleColor().CGColor
        //you can change the stroke color
        //shapeLayer.strokeColor = UIColor.redColor().CGColor
        //you can change the line width
        //shapeLayer.lineWidth = 3.0
        subLayer = shapeLayer
        circle.layer.addSublayer(shapeLayer)
        
        circle.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        label.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(circle.snp_bottom).offset(10)
        }
        slider.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.centerY.greaterThanOrEqualTo(300)
            make.centerY.greaterThanOrEqualTo(label)
            make.width.equalTo(view).multipliedBy(0.8)
        }
        
        slider.addTarget(self, action:"sliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }

    func sliderValueChanged(sender: UISlider) {
        label.text = "\(slider.value * 100)"
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: CGFloat(100 * slider.value), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        shapeLayer.fillColor = UIColor.purpleColor().CGColor
        subLayer.removeFromSuperlayer()
        subLayer = shapeLayer
        circle.layer.addSublayer(shapeLayer)
        view.setNeedsDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

