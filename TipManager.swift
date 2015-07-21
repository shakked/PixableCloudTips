//
//  TipManager.swift
//  PixableCloudTips
//
//  Created by Zachary Shakked on 7/21/15.
//  Copyright (c) 2015 Zachary Shakked. All rights reserved.
//

import UIKit

class TipManager: NSObject, CloudTipViewDelegate {
    
    static let sharedManager = TipManager()
    private var isShowingTip : Bool = false
    private var tips : [Tip] = [FavoriteTip(), OfflineModeTip(), SharingTip(), CategoriesTip(), RateUsTip()]
    
    func didShowCloudTipView() {
        isShowingTip = true
    }
    
    func didHideCloudTipView() {
        isShowingTip = false
    }
    
    class func incrementView(viewController: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var viewCount = defaults.integerForKey("\(viewController)Views")
        defaults.setValue(++viewCount, forKey: "\(viewController)Views")
    }
    
    class func viewCount(viewController: String) -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        let viewCount = defaults.integerForKey("\(viewController)Views")
        return viewCount
    }
    
    class func checkTipAction(tipLogic: TipLogic) -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let bool = defaults.boolForKey(tipLogic.rawValue)
        return bool
    }
    
    func showTipIfNecessary(inputPoint: CGPoint) {
        for tip in tips {
            if tip.shouldShow() {
                tip.show(inputPoint)
            }
        }
    }
}

struct Constants {
    struct ViewControllers {
        static let GridViewController = "GridViewController"
        static let ParallaxViewController = "ParallaxViewController"
        static let MyPixableViewController = "MyPixableViewController"
        static let CategoryViewController = "CategoryViewController"
    }
}

enum TipLogic: String {
    case DidFavorite = "DidFavorite"
    case DidAccessMyPixable = "AccessMyPixable"
    case DidShare = "DidShare"
    case DidViewCategories = "DidViewCategories"
    case DidSwipeCategories = "DidSwipeCategories"
    case DidPromptToRateUs = "DidPromptToRateUs"
}

protocol Tip {
    func shouldShow() -> Bool
    func show(highlightedView: UIView)
}

struct FavoriteTip: Tip {
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.checkTipAction(.DidFavorite) && (viewCount == 1 || viewCount >= 4)) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
    
}

struct OfflineModeTip: Tip {
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.checkTipAction(.DidAccessMyPixable) && (viewCount == 1 || viewCount >= 4)) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct SharingTip: Tip {
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.checkTipAction(.DidShare) && viewCount >= 2) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct CategoriesTip: Tip {
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.CategoryViewController)
        if (!TipManager.checkTipAction(.DidSwipeCategories) && viewCount >= 1) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct RateUsTip: Tip {
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.checkTipAction(.DidPromptToRateUs) && viewCount >= 4) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}
