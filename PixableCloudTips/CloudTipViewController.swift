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
    var filledCloudView : FilledCloudView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        animate()
    }
    
    func animate() {
        showCloudTipView()
        showFilledCloudView()
        
//        dispatch_after(0.3, queue: dispatch_get_main_queue()) { () -> Void in
//            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                self.cloudTipView?.alpha = 0.5
//                self.filledCloudView?.alpha = 1.0
//            })
//        }
//        
//        dispatch_after(0.6, queue: dispatch_get_main_queue()) { () -> Void in
//            UIView.animateWithDuration(0.2, animations: { () -> Void in
//                
//            })
//        }
        
    }
    
    func showCloudTipView() {
        cloudTipView?.removeFromSuperview()
        filledCloudView?.removeFromSuperview()
        cloudTipView = CloudTipView(basePoint: CGPointMake(30, 30))
        cloudTipView!.backgroundColor = UIColor.clearColor()
        self.view.addSubview(cloudTipView!)
    }
    
    
    func showFilledCloudView() {
//        filledCloudView = FilledCloudView(frame: cloudTipView!.frame)
//        filledCloudView!.backgroundColor = UIColor.clearColor()
//        filledCloudView!.alpha = 0.0
//        self.view.addSubview(filledCloudView!)
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
        animate()
    }
    
}
