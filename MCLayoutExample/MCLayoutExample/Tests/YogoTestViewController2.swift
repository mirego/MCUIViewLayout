//
//  YogoTestViewController.swift
//  MCLayoutExample
//
//  Created by DION, Luc (MTL) on 2017-02-16.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit

class YogoTestViewController: UIViewController {
    
    fileprivate var mainView: YogoTestView {
        return self.view as! YogoTestView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = YogoTestView()
    }
}
