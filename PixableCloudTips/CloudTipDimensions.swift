//
//  CloudTipDimensions.swift
//  PixableCloudTips
//
//  Created by pixable on 7/14/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit

class CloudTipDimensions: NSObject {
    class func cloudCircles(centerPoint: CGPoint) -> [CloudCircle] {
        let x = centerPoint.x
        let y = centerPoint.y
        println(centerPoint)
        var cloudCircles : [CloudCircle] = []
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 92 , y: y - 79), radius: .Tinier , animationInterval: 0.00000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 77 , y: y - 65), radius: .Tiny   , animationInterval: 0.03333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 65 , y: y - 44), radius: .Smaller, animationInterval: 0.06666))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 42 , y: y - 19), radius: .Medium , animationInterval: 0.10000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 0  , y: y + 0 ), radius: .Huge   , animationInterval: 0.13333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - 40 , y: y + 19), radius: .Medium , animationInterval: 0.13333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - 51 , y: y - 18), radius: .Medium , animationInterval: 0.16666))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 53 , y: y + 19), radius: .Medium , animationInterval: 0.16666))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - 84 , y: y + 0 ), radius: .Large  , animationInterval: 0.20000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 85 , y: y - 1 ), radius: .Large  , animationInterval: 0.20000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - 122, y: y - 10), radius: .Small  , animationInterval: 0.23333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 123, y: y + 10), radius: .Small  , animationInterval: 0.23333))
        return cloudCircles
    }
}

struct CloudCircle {
    let center : CGPoint
    let radius : CGFloat
    let animationInterval : NSTimeInterval
    
    init(center: CGPoint, radius: CloudCircleRadius, animationInterval: NSTimeInterval) {
        self.center = center
        self.radius = radius.rawValue
        self.animationInterval = animationInterval
    }
}

enum AnimationInterval: NSTimeInterval {
    case Zero    = 0.00000
    case Default = 0.06667
}

enum CloudCircleRadius: CGFloat {
    case Huge    = 56.0
    case Large   = 37.0
    case Medium  = 27.0
    case Small   = 17.0
    case Smaller = 11.0
    case Tiny    = 6.0
    case Tinier  = 3.0
}