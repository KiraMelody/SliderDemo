//
//  Myanimation.swift
//  Circle
//
//  Created by TJQ on 16/7/21.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit
import SnapKit

class Myanimation: UIViewController {

    var square:UIView!
    var button:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        square = UIView()
        square.backgroundColor = UIColor.blueColor()
        button =  UIButton(type: UIButtonType.System)
        button.setTitle("Button", forState: UIControlState.Normal)
        
        view.addSubview(square)
        view.addSubview(button)
        square.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        button.snp_makeConstraints { (make) -> Void in
            make.trailing.equalTo(view).offset(-10)
            make.bottom.equalTo(view).offset(-10)
            make.width.equalTo(100)
        }
        button.addTarget(self, action: "animationbegin:", forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }
    func animationbegin (sender: UIButton)
    {
        UIView.animateWithDuration(1, delay: 1, options: .AllowUserInteraction, animations: {
            self.square.center.x = self.view.center.x
            self.square.center.y = self.view.center.y
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 4, options: .AllowUserInteraction, animations: {
            self.square.center.x = 50
            self.square.center.y = 50
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
