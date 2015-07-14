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
    
    init(basePoint: CGPoint) {
        self.basePoint = basePoint
        let frame = CGRectMake(basePoint.x, basePoint.y, 286, 147)
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
//        UIColor.whiteColor().setStroke()
//        cloudColor.setFill()
//        let cloudLayer = CAShapeLayer()
        let cloudCircles : [CloudCircle] = CloudTipDimensions.cloudCircles(CGPointMake(0, 0))
//
//        for cloudCircle in cloudCircles {
//            let path = UIBezierPath(arcCenter: cloudCircle.center, radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
//            path.lineWidth = 4.0
//            path.stroke()
//            paths.append(path)
//        }
//        
//        for path in paths {
//            path.fill()
//        }
        
        for cloudCircle in cloudCircles {

            dispatch_after(cloudCircle.timeUntilNextAnimation, queue: dispatch_get_main_queue(), { () -> Void in
                  self.drawAndAnimate(cloudCircle)
            })
            
        }
    }
    
    func drawAndAnimate(cloudCircle: CloudCircle) {
        let pathLayer = CAShapeLayer()
        let cloudCircle = cloudCircle
        let path = pathForCloudCircle(cloudCircle)
        pathLayer.fillColor = cloudColor.CGColor
        pathLayer.strokeColor = UIColor.whiteColor().CGColor
        pathLayer.lineWidth = 2.0
        pathLayer.path = path.CGPath
        pathLayer.position = cloudCircle.center
        pathLayer.bounds = path.bounds
        
        layer.addSublayer(pathLayer)
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
        pathLayer.addAnimation(animationGroup, forKey: "animate")
        
    }
    
    func pathForCloudCircle(cloudCircle: CloudCircle) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPointMake(0, 0), radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
        return path
    }
    
    func pathForWholeCloud() {
        let cloudCircles : [CloudCircle] = CloudTipDimensions.cloudCircles(CGPointMake(0, 0))
        var paths : [UIBezierPath] = []
        for cloudCircle in cloudCircles {
            let path = UIBezierPath(arcCenter: cloudCircle.center, radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
            path.lineWidth = 4.0
            path.stroke()
            paths.append(path)
        }
        
        for path in paths {
            path.fill()
        }
    }
    
    func animate() {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3.0;
        pathAnimation.fromValue = 0.0;
        pathAnimation.toValue = 1.0;
        self.layer.addAnimation(pathAnimation, forKey: "strokeEnd")
    }
}
