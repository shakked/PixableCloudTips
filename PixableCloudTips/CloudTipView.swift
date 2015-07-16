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
        let frame = CGRect(x: basePoint.x, y: basePoint.y, width: 286, height: 147)
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let cloudCircles : [CloudCircle] = CloudTipDimensions.cloudCircles(CGPointMake(0, 0))
    
        //We draw the white circles first because we want them to be behind the blue circles
        for cloudCircle in cloudCircles {
            self.drawWhiteCircle(cloudCircle)
        }
        
        for cloudCircle in cloudCircles {
            self.drawBlueCircle(cloudCircle)
        }

        //Once the circles are all in their right positions (blue ones on top of white ones), then we animate them
        for layer in self.layer.sublayers {
            if let layer = layer as? CloudCircleLayer {
                self.addAnimationToLayer(layer)
            }
        }
        
    }
    
    func drawWhiteCircle(cloudCircle: CloudCircle) {
        let whiteCircleLayer = CloudCircleLayer()
        let path = pathForCloudCircle(cloudCircle)
        whiteCircleLayer.delay = cloudCircle.animationInterval
        whiteCircleLayer.fillColor = UIColor.whiteColor().CGColor
        whiteCircleLayer.strokeColor = UIColor.whiteColor().CGColor
        whiteCircleLayer.lineWidth = 6.0
        whiteCircleLayer.path = path.CGPath
        whiteCircleLayer.position = cloudCircle.center
        whiteCircleLayer.bounds = path.bounds
        
        layer.addSublayer(whiteCircleLayer)
    }
    
    func drawBlueCircle(cloudCircle: CloudCircle) {
        let path = pathForCloudCircle(cloudCircle)
        let blueCircleLayer = CloudCircleLayer()
        blueCircleLayer.delay = cloudCircle.animationInterval
        blueCircleLayer.fillColor = cloudColor.CGColor
        blueCircleLayer.strokeColor = cloudColor.CGColor
        blueCircleLayer.lineWidth = 3.0
        blueCircleLayer.path = pathForCloudCircle(cloudCircle).CGPath
        blueCircleLayer.position = cloudCircle.center
        blueCircleLayer.bounds = path.bounds
        
        layer.addSublayer(blueCircleLayer)
    }
    
    
    func addAnimationToLayer(layer: CloudCircleLayer) {
        let to110animation = CABasicAnimation(keyPath:"transform.scale")
        to110animation.beginTime = 0.0 + layer.delay
        to110animation.duration = 0.267
        to110animation.fromValue = 0.0
        to110animation.toValue = 1.0
        
        let to90animation = CABasicAnimation(keyPath:"transform.scale")
        to90animation.beginTime = 0.267 + layer.delay
        to90animation.duration = 0.133
        to90animation.fromValue = 1.1
        to90animation.toValue = 0.9
        
        let to100animation = CABasicAnimation(keyPath:"transform.scale")
        to100animation.beginTime = 0.4 + layer.delay
        to100animation.duration = 0.133
        to100animation.fromValue = 0.9
        to100animation.toValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 3.0
        animationGroup.animations = [to110animation, to90animation, to100animation]
        layer.addAnimation(animationGroup, forKey: "animation")
    }
    
    func pathForCloudCircle(cloudCircle: CloudCircle) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPointMake(0, 0), radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
        return path
    }
    
}

class CloudCircleLayer: CAShapeLayer {
    var delay : NSTimeInterval!
}
