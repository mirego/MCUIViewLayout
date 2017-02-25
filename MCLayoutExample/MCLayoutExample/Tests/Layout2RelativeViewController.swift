//
//  Layout2RelativeViewController.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-22.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class Layout2RelativeViewController: UIViewController {
    fileprivate var mainView: Layout2RelativeView {
        return self.view as! Layout2RelativeView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = Layout2RelativeView()
    }
}
