////
////  FilledCloudView.swift
////  PixableCloudTips
////
////  Created by pixable on 7/15/15.
////  Copyright (c) 2015 Zachary Shakked. All rights reserved.
////
//
//import UIKit
//
//class FilledCloudView: UIView {
//    let cloudColor = UIColor(red: 51.0/255, green: 131.0/255, blue: 1, alpha: 1.0)
//    
//
//    override func drawRect(rect: CGRect) {
//        let cloudCircles : [CloudCircle] = CloudTipDimensions.cloudCircles(CGPointMake(0, 0))
//        var path : UIBezierPath?
//        cloudColor.setFill()
//        UIColor.whiteColor().setStroke()
//        
//        for cloudCircle in cloudCircles {
//            if let path = path {
//                path.appendPath(UIBezierPath(arcCenter: cloudCircle.center, radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true))
//            } else {
//                path = UIBezierPath(arcCenter: cloudCircle.center, radius: cloudCircle.radius,  startAngle: CGFloat(0.0), endAngle: CGFloat(2.0 * M_PI), clockwise: true)
//            }
//        }
//        path?.lineWidth = 3.0
//        path?.stroke()
//        path?.fill()
//
//    
//    }
//
//}
