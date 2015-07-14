//
//  CloudTipViewController.swift
//  PixableCloudTips
//
//  Created by pixable on 7/14/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit

class CloudTipViewController: UIViewController {

    var cloudTipView : CloudTipView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cloudTipView = CloudTipView(basePoint: CGPointMake(30, 30))
        cloudTipView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(cloudTipView)
        self.view.backgroundColor = UIColor.purpleColor()
    }
    
    init() {
        super.init(nibName: "CloudTipViewController", bundle: NSBundle.mainBundle())    
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var animatePressed: UIButton!
    
    @IBAction func aniamtedPressed(sender: AnyObject) {
        cloudTipView.removeFromSuperview()
        cloudTipView = CloudTipView(basePoint: CGPointMake(30, 30))
        cloudTipView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(cloudTipView)
    }
}
