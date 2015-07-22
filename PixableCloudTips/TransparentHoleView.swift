//
//  TransparentHoleView.swift
//  PixableCloudTips
//
//  Created by Zachary Shakked on 7/22/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit
@IBDesignable
class TransparentHoleView: UIView {
    var transparentViews : [UIView]
    
    required init(frame: CGRect, transparentViews: [UIView]) {
        self.transparentViews = transparentViews
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        for view in transparentViews {
            path.appendPath(UIBezierPath(roundedRect: view.frame, cornerRadius: view.layer.cornerRadius))
        }
        path.usesEvenOddFillRule = true
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).setFill()
        path.fill()
    }
}