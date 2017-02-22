//
//  Layout2ChainedLayoutViewController.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-20.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import UIKit

protocol Layout2ChainedLayoutViewControllerDelegate: class {
}

class Layout2ChainedLayoutViewController: UIViewController {
    weak var delegate: Layout2ChainedLayoutViewControllerDelegate?
    
    fileprivate var mainView: Layout2ChainedLayoutView {
        return self.view as! Layout2ChainedLayoutView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = Layout2ChainedLayoutView()
        mainView.delegate = self
    }
}

// MARK: Layout2ChainedLayoutDelegate
extension Layout2ChainedLayoutViewController: Layout2ChainedLayoutViewDelegate {
}
