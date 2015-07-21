//
//  CloudTipDimensions.swift
//  PixableCloudTips
//
//  Created by pixable on 7/14/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit

class CloudTipDimensions: NSObject {
    
    class func cloudCircles(centerPoint: CGPoint, entryType: EntryType) -> [CloudCircle] {
        let x = centerPoint.x
        let y = centerPoint.y
        
        var cloudCircles : [CloudCircle] = []
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + Offset.Zero     , y: y + Offset.Zero    ), radius: .Huge   , startTime: 0.13333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - Offset.Farther  , y: y + Offset.Zero    ), radius: .Large  , startTime: 0.20000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + Offset.Farther  , y: y + Offset.Zero    ), radius: .Large  , startTime: 0.20000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + Offset.Nearer   , y: y - Offset.Close   ), radius: .Medium , startTime: 0.10000))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - Offset.Nearer   , y: y + Offset.Close   ), radius: .Medium , startTime: 0.13333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - Offset.Near     , y: y - Offset.Close   ), radius: .Medium , startTime: 0.16666))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + Offset.Near     , y: y + Offset.Close   ), radius: .Medium , startTime: 0.16666))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x - Offset.Farthest , y: y - Offset.Adjacent), radius: .Small  , startTime: 0.23333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + Offset.Farthest , y: y + Offset.Adjacent), radius: .Small  , startTime: 0.23333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + (Offset.Far * entryType.x), y: y - (44 * entryType.y        )), radius: .Smaller, startTime: 0.06666))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + (77 * entryType.x)        , y: y - (Offset.Far * entryType.y)), radius: .Tiny   , startTime: 0.03333))
        cloudCircles.append(CloudCircle(center: CGPoint(x: x + (92 * entryType.x)        , y: y - (79 * entryType.y        )), radius: .Tinier , startTime: 0.00000))
        return cloudCircles
    }
}

struct Offset {
    static let Zero     : CGFloat = 0
    static let Adjacent : CGFloat = 10
    static let Close    : CGFloat = 19
    static let Nearer   : CGFloat = 41
    static let Near     : CGFloat = 52
    static let Far      : CGFloat = 65
    static let Farther  : CGFloat = 85
    static let Farthest : CGFloat = 123
}

struct CloudCircle {
    let center : CGPoint
    let radius : CGFloat
    let startTime : NSTimeInterval
    
    init(center: CGPoint, radius: CloudCircleRadius, startTime: NSTimeInterval) {
        self.center = center
        self.radius = radius.rawValue
        self.startTime = startTime
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

enum EntryType {
    case TopLeft
    case TopCenter
    case TopRight
    case BottomLeft
    case BottomCenter
    case BottomRight
    
    var x : CGFloat {
        switch self {
        case .TopLeft:
            return -1
        case .TopCenter:
            return 0.5
        case .TopRight:
            return 1
        case .BottomLeft:
            return -1
        case .BottomCenter:
            return 0.5
        case .BottomRight:
            return 1
        }
    }
    
    var y : CGFloat {
        switch self {
        case .TopLeft:
            return 1
        case .TopCenter:
            return 1
        case .TopRight:
            return 1.3
        case .BottomLeft:
            return -1
        case .BottomCenter:
            return -1.3
        case .BottomRight:
            return -1
        }
    }
}