//
//  SimpleView.swift
//  TestFunctionBuilder
//
//  Created by Gualtiero Frigerio on 27/02/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import UIKit

struct EmptyView:UIKitView {
    var view: UIView {
        UIView()
    }
}

struct SimpleView:UIKitView {
    var view:UIView {
        internalView ?? UIView()
    }
    
    init(withBackgroundColor color:UIColor?) {
        let view = UIView()
        view.backgroundColor = color
        internalView = view
    }
    
    private var internalView:UIView?
}
