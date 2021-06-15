//
//  ViewBuilder.swift
//  TestFunctionBuilder
//
//  Created by Gualtiero Frigerio on 27/02/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

protocol UIKitView {
    var view:UIView{get}
    var views:[UIView] {get}
}

extension UIKitView {
    var views:[UIView] {
        [view]
    }
}

struct UIKitViewArray: UIKitView {
    var view: UIView {
        if storedUIKitViews.count > 0 {
            return storedUIKitViews[0].view
        }
        return UIView()
    }
    
    var views:[UIView] {
        storedUIKitViews.map{$0.view}
    }
    
    init(withViews views:[UIKitView]) {
        storedUIKitViews = views
    }
    
    private var storedUIKitViews:[UIKitView] = []
}


@resultBuilder
struct UIViewBuilder {
    static func buildBlock(_ views:UIKitView...) -> [UIView] {
        views.map{$0.view}
    }
}

@resultBuilder
struct UIKitViewBuilder {
    static func buildBlock(_ views:UIKitView...) -> UIKitView {
        print("buildBlock views \(views)")
        return UIKitViewArray(withViews: views)
    }
    
    static func buildEither(first: UIKitView) -> UIKitView {
        print("buildEither first \(first)")
        return first
    }

    static func buildEither(second: UIKitView) -> UIKitView {
        print("buildEither second \(second)")
        return second
    }
    
    static func buildIf(_ view:UIKitView?) -> UIKitView {
        view ?? EmptyView()
    }
    
    // buildIf has been replaced by buildOptional
    static func buildOptional(_ component: UIKitView?) -> UIKitView {
        component ?? EmptyView()
    }
}
