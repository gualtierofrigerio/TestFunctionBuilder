//
//  ContainerView.swift
//  TestFunctionBuilder
//
//  Created by Gualtiero Frigerio on 27/02/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import UIKit

enum ContainerViewAlignment {
    case horizontal
    case vertical
}

struct ContainerView:UIKitView {
    var view: UIView {
        containerView
    }
    init(frame:CGRect, align:ContainerViewAlignment, @UIViewBuilder _ builder:()->[UIView]) {
        let views = builder()
        containerView = UIView(frame: frame)
        addViews(views, align: align, size: frame.size)
    }
    
    // MARK: - Private
    private var containerView:UIView
    
    private func addViews(_ views:[UIView], align:ContainerViewAlignment, size:CGSize) {
        var height = size.height
        var width = size.width
        var xStep:CGFloat = 0.0
        var yStep:CGFloat = 0.0
        if align == .horizontal {
            width = size.width / CGFloat(views.count)
            xStep = width
        }
        else {
            height = size.height / CGFloat(views.count)
            yStep = height
        }
        var frame = CGRect(x: 0, y: 0, width: width, height: height)
        for view in views {
            view.frame = frame
            containerView.addSubview(view)
            frame.origin.x += xStep
            frame.origin.y += yStep
        }
    }
}
