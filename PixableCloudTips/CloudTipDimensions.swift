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
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 220.5, y + 22.5  ), radius: 7.0 , timeUntilNextAnimation: 0.0667))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 208.5, y + 44.5  ), radius: 11.0, timeUntilNextAnimation: 0.0667))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 185.5, y + 69.5  ), radius: 27.0, timeUntilNextAnimation: 0.0000))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 143.5, y + 87.5  ), radius: 56.0, timeUntilNextAnimation: 0.0667))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 102.5, y + 107.5 ), radius: 28.0, timeUntilNextAnimation: 0.0000))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 93.5,  y + 69.5  ), radius: 27.5, timeUntilNextAnimation: 0.0667))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 194.5, y + 106.5 ), radius: 28.0, timeUntilNextAnimation: 0.0000))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 227.5, y + 87.5  ), radius: 37.0, timeUntilNextAnimation: 0.0667))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 59.5 , y + 88.5  ), radius: 37.0, timeUntilNextAnimation: 0.0000))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 265.5, y + 97.5  ), radius: 17.0, timeUntilNextAnimation: 0.0667))
        cloudCircles.append(CloudCircle(center: CGPointMake(x + 21.5 , y + 77.5  ), radius: 17.0, timeUntilNextAnimation: 0.0000))
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
    let timeUntilNextAnimation : NSTimeInterval
    
    init(center: CGPoint, radius: CGFloat, timeUntilNextAnimation: NSTimeInterval) {
        self.center = center
        self.radius = radius
        self.timeUntilNextAnimation = timeUntilNextAnimation
    }
}
