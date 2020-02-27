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
}

@_functionBuilder
struct UIViewBuilder {
    static func buildBlock(_ views:UIKitView...) -> [UIView] {
        views.map{$0.view}
    }
}
