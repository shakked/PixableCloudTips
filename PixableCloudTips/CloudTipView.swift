//
//  CloudTipView.swift
//  PixableCloudTips
//
//  Created by pixable on 7/14/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit
import Foundation

class CloudTipView: UIView {
    let cloudColor = UIColor(red: 51.0/255, green: 131.0/255, blue: 1, alpha: 1.0)
    let basePoint : CGPoint
    var cloudView : UIView
    
    init(basePoint: CGPoint) {
        self.basePoint = basePoint
        let frame = CGRectMake(basePoint.x, basePoint.y, 286, 147)
        cloudView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        addSubview(cloudView)
//        UIColor.whiteColor().setStroke()
//        cloudColor.setFill()
//        let cloudLayer = CAShapeLayer()
        let cloudCircles : [CloudCircle] = CloudTipDimensions.cloudCircles(CGPointMake(0, 0))
        

        
        for cloudCircle in cloudCircles {
            dispatch_after(0.00, queue: dispatch_get_main_queue(), {
                  self.drawAndAnimate(cloudCircle)
                dispatch_after(0.00, queue: dispatch_get_main_queue(), { () -> Void in
                    self.drawAndAnimateBlueCircle(cloudCircle)
                })
            })

        }
    }
    
    func doShit() {
        let filledCloudView = FilledCloudView()
        filledCloudView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        filledCloudView.backgroundColor = UIColor.clearColor()
        filledCloudView.alpha = 0.0
        addSubview(filledCloudView)
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            filledCloudView.alpha = 1.0
        })
        
    }
    
    func drawAndAnimate(cloudCircle: CloudCircle) {
        let outlinedPathLayer = CAShapeLayer()
        let path = pathForCloudCircle(cloudCircle)
        outlinedPathLayer.fillColor = UIColor.whiteColor().CGColor
        outlinedPathLayer.strokeColor = UIColor.whiteColor().CGColor
        outlinedPathLayer.lineWidth = 6.0
        outlinedPathLayer.path = path.CGPath
        outlinedPathLayer.position = cloudCircle.center
        outlinedPathLayer.bounds = path.bounds
        
        let filledPathLayer = CAShapeLayer()
        filledPathLayer.fillColor = cloudColor.CGColor
        filledPathLayer.strokeColor = cloudColor.CGColor
        filledPathLayer.lineWidth = 2.0
        filledPathLayer.path = pathForCloudCircle(cloudCircle).CGPath
        filledPathLayer.position = cloudCircle.center
        filledPathLayer.bounds = path.bounds


        cloudView.layer.addSublayer(outlinedPathLayer)
//        cloudView.layer.addSublayer(filledPathLayer)
        
        let to110animation = CABasicAnimation(keyPath:"transform.scale")
        to110animation.beginTime = 0.0
        to110animation.duration = 0.267
        to110animation.fromValue = 0.0
        to110animation.toValue = 1.0
        
        let to90animation = CABasicAnimation(keyPath:"transform.scale")
        to90animation.beginTime = 0.267
        to90animation.duration = 0.133
        to90animation.fromValue = 1.1
        to90animation.toValue = 0.9
        
        let to100animation = CABasicAnimation(keyPath:"transform.scale")
        to100animation.beginTime = 0.4
        to100animation.duration = 0.133
        to100animation.fromValue = 0.9
        to100animation.toValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 3.0
        animationGroup.animations = [to110animation, to90animation, to100animation]
        outlinedPathLayer.addAnimation(animationGroup, forKey: "animate")
        filledPathLayer.addAnimation(animationGroup, forKey: "animate")
        
    }
    
    func drawAndAnimateBlueCircle(cloudCircle: CloudCircle) {
        let outlinedPathLayer = CAShapeLayer()
        let path = pathForCloudCircle(cloudCircle)
        outlinedPathLayer.fillColor = UIColor.whiteColor().CGColor
        outlinedPathLayer.strokeColor = UIColor.whiteColor().CGColor
        outlinedPathLayer.lineWidth = 4.0
        outlinedPathLayer.path = path.CGPath
        outlinedPathLayer.position = cloudCircle.center
        outlinedPathLayer.bounds = path.bounds
        
        let filledPathLayer = CAShapeLayer()
        filledPathLayer.fillColor = cloudColor.CGColor
        filledPathLayer.strokeColor = cloudColor.CGColor
        filledPathLayer.lineWidth = 3.0
        filledPathLayer.path = pathForCloudCircle(cloudCircle).CGPath
        filledPathLayer.position = cloudCircle.center
        filledPathLayer.bounds = path.bounds
        
        
        cloudView.layer.addSublayer(filledPathLayer)
        
        let to110animation = CABasicAnimation(keyPath:"transform.scale")
        to110animation.beginTime = 0.0
        to110animation.duration = 0.267
        to110animation.fromValue = 0.0
        to110animation.toValue = 1.0
        
        let to90animation = CABasicAnimation(keyPath:"transform.scale")
        to90animation.beginTime = 0.267
        to90animation.duration = 0.133
        to90animation.fromValue = 1.1
        to90animation.toValue = 0.9
        
        let to100animation = CABasicAnimation(keyPath:"transform.scale")
        to100animation.beginTime = 0.4
        to100animation.duration = 0.133
        to100animation.fromValue = 0.9
        to100animation.toValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 3.0
        animationGroup.animations = [to110animation, to90animation, to100animation]
        outlinedPathLayer.addAnimation(animationGroup, forKey: "animate")
        filledPathLayer.addAnimation(animationGroup, forKey: "animate")
    }
    
    func pathForCloudCircle(cloudCircle: CloudCircle) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPointMake(0, 0), radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
        return path
    }
    
    func pathForOutlinesCloudCircle(cloudCircle: CloudCircle) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPointMake(0, 0), radius: cloudCircle.radius + 20,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
        return path
    }
    
    func pathForWholeCloud() {
        
    }
    
    func animate() {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3.0;
        pathAnimation.fromValue = 0.0;
        pathAnimation.toValue = 1.0;
        self.layer.addAnimation(pathAnimation, forKey: "strokeEnd")
    }
}
