//
//  Layout2MarginsAndPaddingsLeftRightViewController.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-21.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

protocol Layout2MarginsAndPaddingsLeftRightViewControllerDelegate: class {
}

class Layout2MarginsAndPaddingsLeftRightViewController: UIViewController {
    weak var delegate: Layout2MarginsAndPaddingsLeftRightViewControllerDelegate?
    
    fileprivate var mainView: Layout2MarginsAndPaddingsLeftRightView {
        return self.view as! Layout2MarginsAndPaddingsLeftRightView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = Layout2MarginsAndPaddingsLeftRightView()
    }
}
