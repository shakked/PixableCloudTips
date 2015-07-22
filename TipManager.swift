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
    private var tips : [Tip] = [FavoriteTip(), OfflineModeTip(), SharingTip(), CategoriesTip(), SwipeSubCategoriesTip(), RateUsTip()]
    
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
    
    class func didShowTipType(tipType: TipType) -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let bool = defaults.boolForKey(tipType.rawValue)
        return bool
    }
    
    func tipToShow() -> Tip? {
        for tip in tips {
            if tip.shouldShow() {
                return tip
            }
        }
        return nil
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

enum TipType: String {
    case Favorite = "Favorite"
    case OfflineMode = "OfflineMode"
    case Sharing = "Sharing"
    case Categories = "Categories"
    case SwipeSubCategories = "SwipeSubCategories"
    case RateUs = "RateUs"
}

protocol Tip {
    var type : TipType { get }
    var text : String { get }
    func shouldShow() -> Bool
}

struct FavoriteTip: Tip {
    let type : TipType = .Favorite
    let text = "Tap the heart to save an article or photo"
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.didShowTipType(type) && (viewCount == 1 || viewCount >= 4)) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
    
}

struct OfflineModeTip: Tip {
    let type : TipType = .OfflineMode
    let text = "Access your saved content here even when you're offline"
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.didShowTipType(type) && (viewCount == 1 || viewCount >= 4)) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct SharingTip: Tip {
    let type : TipType = .Sharing
    let text = "Pixable makes sharing with your friends easy"
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.didShowTipType(type) && viewCount >= 2) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct CategoriesTip: Tip {
    let type : TipType = .Categories
    let text = "Welcome back! To view content from more categories tap here"
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.CategoryViewController)
        if (!TipManager.didShowTipType(type) && viewCount >= 1) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct SwipeSubCategoriesTip: Tip {
    let type : TipType = .SwipeSubCategories
    let text = "Discover more Pixable stories by swiping right here"
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.didShowTipType(type) && viewCount >= 1) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

struct RateUsTip: Tip {
    let type : TipType = .RateUs
    let text = "Are you enjoying Pixable? Please rate the app"
    func shouldShow() -> Bool {
        let viewCount = TipManager.viewCount(Constants.ViewControllers.GridViewController)
        if (!TipManager.didShowTipType(type) && viewCount >= 4) && !TipManager.sharedManager.isShowingTip {
            return true
        }
        return false
    }
}

