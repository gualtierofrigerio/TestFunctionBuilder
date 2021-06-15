//
//  ViewController.swift
//  TestFunctionBuilder
//
//  Created by Gualtiero Frigerio on 26/02/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let statement = false
        let view1 = SimpleView(withBackgroundColor: .yellow)
        let view2 = SimpleView(withBackgroundColor: .red)
        let view3 = SimpleView(withBackgroundColor: .green)
        let frame = self.view.frame
//        let containerView = ContainerView(frame:frame, align:.vertical) {
//            view1
//            view2
//            SimpleView(withBackgroundColor: .blue)
//            ContainerView(frame:frame, align:.horizontal) {
//                SimpleView(withBackgroundColor: .orange)
//                SimpleView(withBackgroundColor: .green)
//            }
//        }
        let container = ContainerView(frame: frame) {
            view1
            if statement {
                view2
            }
            else {
                view3
            }
            if statement {
                view2
            }
        }
        //self.view.addSubview(containerView.view)
        self.view.addSubview(container.view)
    }
}

