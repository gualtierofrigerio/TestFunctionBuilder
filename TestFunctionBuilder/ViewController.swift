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
        
        let view1 = SimpleView(withBackgroundColor: .yellow)
        let view2 = SimpleView(withBackgroundColor: .red)
        let frame = self.view.frame
        let containerView = ContainerView(frame:frame, align:.vertical) {
            view1
            view2
            SimpleView(withBackgroundColor: .blue)
        }
        self.view.addSubview(containerView.view)
    }
}

