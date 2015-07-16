//
//  CloudTipDimensions.swift
//  PixableCloudTips
//
//  Created by pixable on 7/14/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit

class CloudTipDimensions: NSObject {
    class func cloudCircles(basePoint: CGPoint) -> [CloudCircle] {
        let x = basePoint.x
        let y = basePoint.y
        var cloudCircles : [CloudCircle] = []

        let hugeCircleRadius    : CGFloat = 56.0
        let largeCircleRadius   : CGFloat = 37.0
        let mediumCircleRadius  : CGFloat = 27.0
        let smallCircleRadius   : CGFloat = 17.0
        let smallerCircleRadius : CGFloat = 11.0
        let tiniestCircleRadius : CGFloat = 7.0
        
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 220.5, y: y + 22.5  ), radius: .Tiny   , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 208.5, y: y + 44.5  ), radius: .Smaller, animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 185.5, y: y + 69.5  ), radius: .Medium , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 143.5, y: y + 87.5  ), radius: .Huge   , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 102.5, y: y + 107.5 ), radius: .Medium , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 93.5,  y: y + 69.5  ), radius: .Medium , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 194.5, y: y + 106.5 ), radius: .Medium , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 227.5, y: y + 87.5  ), radius: .Large  , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 59.5 , y: y + 88.5  ), radius: .Large  , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 265.5, y: y + 97.5  ), radius: .Small  , animationInterval: .Zero))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + 21.5 , y: y + 77.5  ), radius: .Small  , animationInterval: .Zero))
        return cloudCircles
    }
    
    class func frame(basePoint: CGPoint) -> CGRect {
        let frame = CGRectMake(basePoint.x - 235.5, basePoint.y - 9.5, 286, 147)
        return frame
    }
}

struct CloudCircle {
    let center : CGPoint
    let radius : CGFloat
    let animationInterval : NSTimeInterval
    
    init(center: CGPoint, radius: CloudCircleRadius, animationInterval: AnimationInterval) {
        self.center = center
        self.radius = radius.rawValue
        self.animationInterval = animationInterval.rawValue
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
    case Tiny    = 7.0
}