//
//  CloudTipViewController.swift
//  PixableCloudTips
//
//  Created by pixable on 7/14/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit

class CloudTipViewController: UIViewController {
    
    var cloudTipView : CloudTipView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        animate()
    }
    
    func animate() {
        showCloudTipView()
    }
    
    func showCloudTipView() {
        cloudTipView?.removeFromSuperview()
        cloudTipView = CloudTipView(basePoint: CGPointMake(150, 200), entryType: .TopCenter)
        cloudTipView!.backgroundColor = UIColor.clearColor()
        view.addSubview(cloudTipView!)
    }
    
    init() {
        super.init(nibName: "CloudTipViewController", bundle: NSBundle.mainBundle())
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func aniamtedPressed(sender: AnyObject) {
        animate()
    }
    
}
