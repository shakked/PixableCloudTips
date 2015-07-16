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
    var textLabel : UILabel

    init(basePoint: CGPoint) {
        self.basePoint = basePoint
        let frame = CGRect(x: basePoint.x - 142, y: basePoint.y - 87, width: 284, height: 146)
        textLabel = UILabel(frame: CGRect(x: 60, y: 62, width: 170, height: 50))
        textLabel.text = "Pixable makes sharing with your friends easy!"
        textLabel.numberOfLines = 2
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.font = UIFont(name: "AvenirNext-Regular", size: 15.0)!
        textLabel.textColor = UIColor.whiteColor()  
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let cloudCircles : [CloudCircle] = CloudTipDimensions.cloudCircles(CGPoint(x: 142, y: 88))
        
        addSubview(textLabel)
        textLabel.layer.zPosition = 1
        
        
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
                self.addAnimationToLayer(layer, layerDelay: layer.delay)
            }
        }
        self.addAnimationToLayer(textLabel.layer, layerDelay: 0)
        
        //After a 2 second delay, we animate them all to be removed
        dispatch_after(2.0, queue: dispatch_get_main_queue()) {
            for layer in self.layer.sublayers.reverse() {
                if let layer = layer as? CloudCircleLayer {
                    self.hideAnimationToLayer(layer, layerDelay: layer.delay)
                }
            }
            self.hideAnimationToLayer(self.textLabel.layer, layerDelay: 0.2333)
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
    
    
    func addAnimationToLayer(layer: CALayer, layerDelay: NSTimeInterval = 0) {
        let to110animation = CABasicAnimation(keyPath:"transform.scale")
        to110animation.beginTime = 0.0 + layerDelay
        to110animation.duration = 0.267
        to110animation.fromValue = 0.0
        to110animation.toValue = 1.1
        
        let to90animation = CABasicAnimation(keyPath:"transform.scale")
        to90animation.beginTime = 0.267 + layerDelay
        to90animation.duration = 0.133
        to90animation.fromValue = 1.1
        to90animation.toValue = 0.9
        
        let to100animation = CABasicAnimation(keyPath:"transform.scale")
        to100animation.beginTime = 0.4 + layerDelay
        to100animation.duration = 0.133
        to100animation.fromValue = 0.9
        to100animation.toValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 0.533 + layerDelay
        animationGroup.animations = [to110animation, to90animation, to100animation]
        layer.addAnimation(animationGroup, forKey: "animation")
    }
    
    func hideAnimationToLayer(layer: CALayer, layerDelay: NSTimeInterval = 0) {
        let to110animation = CABasicAnimation(keyPath:"transform.scale")
        to110animation.beginTime = 0.0 + layerDelay
        to110animation.duration = 0.267
        to110animation.fromValue = 1.0
        to110animation.toValue = 1.1
        
        let to0animation = CABasicAnimation(keyPath:"transform.scale")
        to0animation.beginTime = 0.267 + layerDelay
        to0animation.duration = 0.267
        to0animation.fromValue = 1.1
        to0animation.toValue = 0.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.delegate = self
        animationGroup.duration = 0.534 + layerDelay
        animationGroup.animations = [to110animation, to0animation]
        animationGroup.setValue(layer, forKey: "layer")
        layer.addAnimation(animationGroup, forKey: "animation")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if let layer = anim.valueForKey("layer") as? CALayer {
             layer.removeFromSuperlayer()
        }
    }
    
    func pathForCloudCircle(cloudCircle: CloudCircle) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPointMake(0, 0), radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
        return path
    }
}

class CloudCircleLayer: CAShapeLayer {
    var delay : NSTimeInterval!
}
